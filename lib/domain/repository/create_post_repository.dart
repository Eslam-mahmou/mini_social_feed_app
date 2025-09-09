import 'package:mini_social_feed/core/common/result.dart';

import '../entity/past_response_entity.dart';

abstract class CreatePostRepository {
  Future<Result<void>> createPost(PostResponseEntity post);
}
