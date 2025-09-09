import 'package:injectable/injectable.dart';

import '../../core/common/result.dart';
import '../entity/past_response_entity.dart';
import '../repository/create_post_repository.dart';

@injectable
class CreatePostUseCase {
  final CreatePostRepository _createPostRepository;

  CreatePostUseCase(this._createPostRepository);

  Future<Result<void>> createPost(PostResponseEntity post) async {
    return await _createPostRepository.createPost(post);
  }
}
