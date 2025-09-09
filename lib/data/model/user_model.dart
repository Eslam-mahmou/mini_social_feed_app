import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.username,
    required super.email,
    super.photoUrl,
  });
  factory UserModel.fromJson(Map<String, dynamic> json, String uid) {
    return UserModel(
      uid: uid,
      username: json['username']??"",
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}
