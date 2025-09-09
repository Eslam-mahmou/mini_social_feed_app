import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

abstract class HomeRepository {
  Future<Result<UserDataResponseEntity>> getUserData();
}