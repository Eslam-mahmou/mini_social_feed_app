import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/app_constant.dart';
import '../model/post_response_model.dart';

abstract class CreatePostRemoteDataSource {
  Future<void> createPost(PostResponseModel post);
}
@Injectable(as: CreatePostRemoteDataSource)
class CreatePostRemoteDataSourceImpl implements CreatePostRemoteDataSource {
  final FirebaseFirestore _fireStore;
  CreatePostRemoteDataSourceImpl(this._fireStore);
  @override
  Future<void> createPost(PostResponseModel post)async {
    final doc = _fireStore.collection(AppConstants.postsCollection).doc();
    await doc.set(post.toFireStore());
  }
}