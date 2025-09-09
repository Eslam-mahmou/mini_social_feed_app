import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';
import 'package:mini_social_feed/domain/use_case/home_use_case.dart';

import 'home_tab_stste.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  HomeTabViewModel(this._useCase) : super(GetUserDataLoadingState());
  final HomeTabUseCase _useCase;
  List<UsersDataEntity> users = [];
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    final result = await _useCase.getUserData();
    switch(result){
      case Success():
        final data = result.data;
        users = data?.users??[];
        emit(GetUserDataSuccessState(users));
        break;
      case Error():
        emit(GetUserDataErrorState(result.message.toString()));
        break;

    }
  }
}