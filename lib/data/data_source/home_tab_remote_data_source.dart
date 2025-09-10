import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/data/model/user_data_response_model.dart';

import '../../core/network/api_client.dart';
import '../../core/utils/app_constant.dart';
import '../model/post_response_model.dart';

abstract class HomeTabRemoteDataSource {
  Future<UserDataResponseModel> getUserData();

  Stream<List<PostResponseModel>> getPostsStream();

  Future<void> toggleLike(String postId, String userId);
}

@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  final ApiClient _apiClient;
  final FirebaseFirestore _fireStore;

  HomeTabRemoteDataSourceImpl(this._apiClient, this._fireStore);

  @override
  Future<UserDataResponseModel> getUserData() {
    final result = _apiClient.getUserData();
    return result;
  }

  @override
  Stream<List<PostResponseModel>> getPostsStream() {
    return _fireStore
        .collection(AppConstants.postsCollection)
        .orderBy('createdAt', descending: true)
        .snapshots(includeMetadataChanges: false) // تحسين الأداء
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => PostResponseModel.fromFireStore(doc.data(), doc.id))
              .toList(),
        );
  }

  @override
  Future<void> toggleLike(String postId, String userId) async {
    final postRef = _fireStore
        .collection(AppConstants.postsCollection)
        .doc(postId);

    try {
      await _fireStore.runTransaction((transaction) async {
        final snapshot = await transaction.get(postRef);

        if (!snapshot.exists) {
          throw Exception('Post not found');
        }

        final data = snapshot.data()!;
        final likes = List<String>.from(data['likes'] ?? []);

        if (likes.contains(userId)) {
          likes.remove(userId);
        } else {
          likes.add(userId);
        }

        transaction.update(postRef, {'likes': likes});
      });
    } catch (e) {
      // إعادة المحاولة مرة واحدة في حالة الفشل
      await Future.delayed(Duration(milliseconds: 100));
      await _fireStore.runTransaction((transaction) async {
        final snapshot = await transaction.get(postRef);
        if (snapshot.exists) {
          final data = snapshot.data()!;
          final likes = List<String>.from(data['likes'] ?? []);
          if (likes.contains(userId)) {
            likes.remove(userId);
          } else {
            likes.add(userId);
          }
          transaction.update(postRef, {'likes': likes});
        }
      });
    }
  }
}
