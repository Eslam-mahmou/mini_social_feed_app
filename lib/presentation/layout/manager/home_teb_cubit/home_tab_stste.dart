import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

import '../../../../domain/entity/past_response_Entity.dart';

sealed class HomeTabState {}

class HomeTabLoadingState extends HomeTabState {}

class HomeTabSuccessState extends HomeTabState {
  final List<UsersDataEntity> users;
  final List<PostResponseEntity> posts;
  HomeTabSuccessState({required this.users, required this.posts});
}

class HomeTabErrorState extends HomeTabState {
  final String message;
  HomeTabErrorState(this.message);
}

class HomeTabLikeSuccessState extends HomeTabState {
  final List<PostResponseEntity> posts;
  HomeTabLikeSuccessState(this.posts);
}

class HomeTabLikeErrorState extends HomeTabState {
  final String message;
  HomeTabLikeErrorState(this.message);
}
