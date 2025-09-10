import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';
import 'package:mini_social_feed/domain/use_case/home_use_case.dart';

import '../../../../domain/entity/past_response_Entity.dart';
import 'home_tab_stste.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  HomeTabViewModel(this._useCase) : super(HomeTabLoadingState());
  final HomeTabUseCase _useCase;
  List<UsersDataEntity> users = [];
  List<PostResponseEntity> posts = [];
  Stream<List<PostResponseEntity>> get postsStream => _useCase.getPostsStream();

  // دالة للتحقق من حالة الـ like
  bool isLiked(PostResponseEntity post) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) return false;
    return post.likes.contains(currentUserId);
  }

  Future<void> loadInitialData() async {
    emit(HomeTabLoadingState());

    try {
      final userDataResult = await _useCase.getUserData();

      switch (userDataResult) {
        case Success():
          users = userDataResult.data?.users ?? [];
          emit(HomeTabSuccessState(users: users, posts: []));
          break;
        case Error():
          emit(HomeTabErrorState(userDataResult.message.toString()));
          break;
      }
    } catch (e) {
      emit(HomeTabErrorState(e.toString()));
    }
  }

  Future<void> getUserData() async {
    final result = await _useCase.getUserData();
    switch (result) {
      case Success():
        users = result.data?.users ?? [];
        emit(HomeTabSuccessState(users: users, posts: posts));
        break;
      case Error():
        emit(HomeTabErrorState(result.message.toString()));
        break;
    }
  }

  Future<void> toggleLike(String postId, String userId) async {
    // إرسال الطلب بدون انتظار الاستجابة
    _useCase.toggleLike(postId, userId).then((result) {
      if (result is Error) {
        emit(HomeTabLikeErrorState(result.message.toString()));
      }
    });
  }
}
