import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/model/user_data_response_model.dart';
import '../utils/app_constant.dart';
part 'api_client.g.dart';
@RestApi(baseUrl: AppConstants.baseUrl)
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @GET("/users")
  Future<UserDataResponseModel> getUserData();
}

