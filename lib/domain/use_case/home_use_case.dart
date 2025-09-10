import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';
import 'package:mini_social_feed/domain/repository/home_repository.dart';

import '../../domain/entity/past_response_Entity.dart';

@injectable
class HomeTabUseCase {
  final HomeRepository _repo;

  HomeTabUseCase(this._repo);

  Future<Result<UserDataResponseEntity>> getUserData() => _repo.getUserData();
  Stream<List<PostResponseEntity>> getPostsStream() => _repo.getPostsStream();
  Future<Result<void>> toggleLike(String postId, String userId) =>
      _repo.toggleLike(postId, userId);
}
