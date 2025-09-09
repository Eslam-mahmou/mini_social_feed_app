import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

sealed class HomeTabState {}
class GetUserDataLoadingState extends HomeTabState {}
class GetUserDataSuccessState extends HomeTabState {
  List<UsersDataEntity> users;
  GetUserDataSuccessState(this.users);
}
class GetUserDataErrorState extends HomeTabState {
  final String message;
  GetUserDataErrorState(this.message);
}