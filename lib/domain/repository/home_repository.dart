import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

import '../../domain/entity/past_response_Entity.dart';

abstract class HomeRepository {
  Future<Result<UserDataResponseEntity>> getUserData();
  Stream<List<PostResponseEntity>> getPostsStream();
  Future<Result<void>> toggleLike(String postId, String userId);
}
