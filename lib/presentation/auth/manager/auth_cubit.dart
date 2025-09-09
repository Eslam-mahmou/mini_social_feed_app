import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mini_social_feed/core/common/result.dart';
import 'package:mini_social_feed/domain/use_case/auth_use_case.dart';

import 'auth_state.dart';

@injectable
class AuthViewModel extends Cubit<AuthState> {
  AuthViewModel(this._useCase) : super(AuthLoadingState());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final AuthUseCase _useCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signInWithEmailAndPassword() async {
    emit(AuthLoadingState());
    final result = await _useCase.signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    switch (result) {
      case Success():
        emit(AuthSuccessState());
        break;
      case Error():
        emit(AuthErrorState(result.message.toString()));
        break;
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    emit(AuthLoadingState());
    final result = await _useCase.signUpWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      usernameController.text,
    );
    switch (result) {
      case Success():
        emit(AuthSuccessState());
        break;
      case Error():
        emit(AuthErrorState(result.message.toString()));
        break;
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());
    final result = await _useCase.signInOrUpWithGoogle();
    switch (result) {
      case Success():
        emit(AuthSuccessState());
        break;
      case Error():
        emit(AuthErrorState(result.message.toString()));
        break;
    }
  }
}
