import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_entity.dart';

import '../repository/auth_repository.dart';

@injectable
class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Result<UserEntity>> signInOrUpWithGoogle() async {
    return _authRepository.signInOrUpWithGoogle();
  }

  Future<Result<UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<Result<UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    return _authRepository.signUpWithEmailAndPassword(
      email,
      password,
      username,
    );
  }
}
