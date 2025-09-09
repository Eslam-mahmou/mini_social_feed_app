import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/data/model/user_data_response_model.dart';

import '../../core/network/api_client.dart';

abstract class HomeTabRemoteDataSource {
    Future <UserDataResponseModel> getUserData();
}
@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  final ApiClient _apiClient;
  HomeTabRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserDataResponseModel> getUserData() {
    final result = _apiClient.getUserData();
    return result;
  }
}