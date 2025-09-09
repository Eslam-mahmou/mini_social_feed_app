sealed  class AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {}
class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}