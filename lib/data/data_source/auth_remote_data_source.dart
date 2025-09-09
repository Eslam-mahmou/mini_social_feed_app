import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_feed/data/model/user_model.dart';
import '../../core/error/failure.dart';
import '../../core/utils/app_constant.dart';
import '../../domain/entity/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);

  Future<UserEntity> signInOrUpWithGoogle();

  Future<UserEntity> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  );
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user;
    final userDoc = await _fireStore
        .collection(AppConstants.usersCollection)
        .doc(user!.uid)
        .get();
    return UserModel.fromJson(userDoc.data()!, userDoc.id);
  }

  @override
  Future<UserEntity> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    final userModel = UserModel(
      username: username,
      email: email,
      photoUrl: null,
      uid: user!.uid,
    );
    await _fireStore
        .collection(AppConstants.usersCollection)
        .doc(user!.uid)
        .set({
          ...userModel.toJson(),
          "createdAt": FieldValue.serverTimestamp(),
        });
    return userModel;
  }

  @override
  Future<UserEntity> signInOrUpWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCred = await _auth.signInWithCredential(credential);
    final user = userCred.user!;

    final isNew = userCred.additionalUserInfo?.isNewUser ?? false;

    if (isNew) {
      final userModel = UserModel(
        uid: user.uid,
        username: user.displayName ?? "",
        email: user.email ?? "",
        photoUrl: user.photoURL,
      );

      await _fireStore
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .set({
            ...userModel.toJson(),
            "createdAt": FieldValue.serverTimestamp(),
          });
    }
    final userDoc = await _fireStore
        .collection(AppConstants.usersCollection)
        .doc(user.uid)
        .get();
    final userData = userDoc.data();

    return userData != null
        ? UserModel.fromJson(userData, user.uid)
        : UserModel(
            uid: user.uid,
            username: user.displayName ?? "",
            email: user.email ?? "",
            photoUrl: user.photoURL,
          );
  }
}
