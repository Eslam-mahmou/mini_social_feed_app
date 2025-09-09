import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_social_feed/domain/entity/past_response_Entity.dart';

class PostResponseModel extends PostResponseEntity {
  const PostResponseModel({
    required super.postId,
    required super.userId,
    required super.title,
    required super.description,
    super.imageUrl,
    required super.likes,
    required super.createdAt,
  });

  factory PostResponseModel.fromFireStore(Map<String, dynamic> json, String postId) {
    return PostResponseModel(
      postId: postId,
      userId: json['userId'] ,
      title: json['title'] ,
      description: json['description'] ,
      imageUrl: json['imageUrl'] ??"",
      likes: List<String>.from(json['likes'] ),
      createdAt: (json['createdAt']).toDate(),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'userId': userId,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'likes': likes,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
