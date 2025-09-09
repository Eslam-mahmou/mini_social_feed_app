import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/core/network/api_execute.dart';
import 'package:mini_social_feed/domain/entity/user_entity.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<UserEntity>> signInOrUpWithGoogle() {
    return executeApi(() {
      return _authRemoteDataSource.signInOrUpWithGoogle();
    });
  }

  @override
  Future<Result<UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return executeApi(() {
      return _authRemoteDataSource.signInWithEmailAndPassword(email, password);
    });
  }

  @override
  Future<Result<UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) {
    return executeApi(() {
      return _authRemoteDataSource.signUpWithEmailAndPassword(
        email,
        password,
        username,
      );
    });
  }
}
