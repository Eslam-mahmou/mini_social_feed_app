import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/di/injectable_initializer.dart';
import 'package:mini_social_feed/core/widget/custom_dialog.dart';
import 'package:mini_social_feed/presentation/post_screen/manager/create_post_cubit.dart';
import 'package:mini_social_feed/presentation/post_screen/view/widget/custom_upload_image.dart';

import '../manager/create_post_state.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt.get<CreatePostViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Post", style: theme.textTheme.bodyMedium),
          centerTitle: true,
        ),
        body: BlocConsumer<CreatePostViewModel, CreatePostState>(
          listener: (context, state) {
            if (state is CreatePostLoadingState ||
                state is UploadImageLoadingState) {
              EasyLoading.show();
            }
            if (state is CreatePostErrorState ||
                state is UploadImageErrorState) {
              EasyLoading.dismiss();
              DialogUtils.showMessage(
                context: context,
                message: state is CreatePostErrorState
                    ? state.message
                    : state is UploadImageErrorState
                    ? state.message
                    : "Something went wrong",
                title: "Error",
                postActionName: "Retry",
                postAction: () {
                  state is CreatePostErrorState
                      ? context.read<CreatePostViewModel>().createPost()
                      : state is UploadImageErrorState
                      ? context.read<CreatePostViewModel>().pickImage()
                      : null;
                },
                negativeActionName: "Cancel",
                negativeAction: () {
                  Navigator.pop(context);
                },
              );
            }
            if (state is CreatePostSuccessState) {
              EasyLoading.dismiss();
              EasyLoading.showSuccess(
                "Post created successfully",
                duration: const Duration(milliseconds: 2000),
              ).then((_) {
                Navigator.pop(context);
              });
            }
            if (state is UploadImageSuccessState) {
              EasyLoading.dismiss();
              EasyLoading.showSuccess(
                "Image uploaded successfully",
                duration: const Duration(milliseconds: 1500),
              );
            }
          },
          builder: (context, state) {
            var viewModel = context.read<CreatePostViewModel>();
            return Form(
              key: viewModel.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 12.heightResponsive),
                      TextFormField(
                        maxLines: 1,
                        controller: viewModel.titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Title is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Title",
                          alignLabelWithHint: true,
                          label: Text("Title"),
                        ),
                      ),
                      SizedBox(height: 16.heightResponsive),
                      TextFormField(
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        controller: viewModel.descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Description is required";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          label: Text("Description"),
                        ),
                      ),
                      SizedBox(height: 16.heightResponsive),
                      CustomUploadImage(
                        onPressed: () {
                          viewModel.pickImage();
                        },
                      ),
                      SizedBox(height: 190.heightResponsive),
                      ElevatedButton(
                        onPressed: () {
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.createPost();
                          }
                        },
                        child: const Text("Publish"),
                      ),
                      SizedBox(height: 16.heightResponsive),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
