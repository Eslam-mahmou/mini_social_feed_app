sealed class CreatePostState {}

class CreatePostLoadingState extends CreatePostState {}

class CreatePostSuccessState extends CreatePostState {}

class CreatePostErrorState extends CreatePostState {
  final String message;

  CreatePostErrorState(this.message);
}

class UploadImageLoadingState extends CreatePostState {}

class UploadImageSuccessState extends CreatePostState {}

class UploadImageErrorState extends CreatePostState {
  final String message;

  UploadImageErrorState(this.message);
}
