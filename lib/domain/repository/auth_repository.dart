import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_entity.dart';

abstract class AuthRepository{
  Future<Result<UserEntity>> signInWithEmailAndPassword(String email, String password);
  Future<Result<UserEntity>> signInOrUpWithGoogle();
  Future<Result<UserEntity>> signUpWithEmailAndPassword(String email, String password,String username);
}