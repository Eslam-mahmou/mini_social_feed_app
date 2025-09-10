import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/core/network/api_execute.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

import '../../domain/entity/past_response_Entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_tab_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeTabRepositoryImpl implements HomeRepository {
  final HomeTabRemoteDataSource _remoteDataSource;

  HomeTabRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<UserDataResponseEntity>> getUserData() {
    return executeApi(() {
      return _remoteDataSource.getUserData();
    });
  }

  @override
  Stream<List<PostResponseEntity>> getPostsStream() {
    return _remoteDataSource.getPostsStream();
  }

  @override
  Future<Result<void>> toggleLike(String postId, String userId) {
    return executeApi(() async {
      await _remoteDataSource.toggleLike(postId, userId);
    });
  }
}
