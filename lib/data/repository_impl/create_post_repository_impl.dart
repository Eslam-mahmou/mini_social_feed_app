import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/core/network/api_execute.dart';
import 'package:mini_social_feed/data/model/post_response_model.dart';


import '../../domain/entity/past_response_entity.dart';
import '../../domain/repository/create_post_repository.dart';
import '../data_source/create_post_remote_data_source.dart';
@Injectable(as: CreatePostRepository)
class CreatePostRepositoryImpl implements CreatePostRepository {
  final CreatePostRemoteDataSource _createPostRemoteDataSource;
  CreatePostRepositoryImpl(this._createPostRemoteDataSource);

  @override
  Future<Result<void>> createPost(PostResponseEntity post) {
   return executeApi(
     ()async {
       final model = PostResponseModel(
         postId: post.postId,
         userId: post.userId,
         title: post.title,
         description: post.description,
         imageUrl: post.imageUrl,
         likes: post.likes,
         createdAt: post.createdAt,
       );
     return await  _createPostRemoteDataSource.createPost(model);
     },
   );
  }
}

