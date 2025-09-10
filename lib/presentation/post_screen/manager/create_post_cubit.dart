import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'create_post_state.dart';
import '../../../core/utils/app_constant.dart';

@injectable
class CreatePostViewModel extends Cubit<CreatePostState> {
  final ImagePicker _picker = ImagePicker();
  String? imageBase64;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> trendingHashtags = [
    "#Flutter",
    "#Firebase",
    "#Dart",
    "#MobileDevelopment",
    "#Coding",
    "#Programming",
    "#Tech",
    "#AppDevelopment",
    "#UIUX",
    "#Design",
    "#Creativity",
  ];
  CreatePostViewModel() : super(CreatePostLoadingState());

  Future<void> pickImage() async {
    try {
      emit(UploadImageLoadingState());

      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        emit(UploadImageErrorState("No image selected"));
        return;
      }

      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      imageBase64 = base64Encode(bytes);

      emit(UploadImageSuccessState());
    } catch (e) {
      emit(UploadImageErrorState(e.toString()));
    }
  }

  Future<void> createPost() async {
    if (!formKey.currentState!.validate()) return;

    emit(CreatePostLoadingState());

    await FirebaseFirestore.instance
        .collection(AppConstants.postsCollection)
        .add({
          'postId': const Uuid().v4(),
          'userId': FirebaseAuth.instance.currentUser!.uid,
          'title': titleController.text,
          'description': descriptionController.text,
          'imageData': imageBase64 ?? "",
          'likes': [],
          'createdAt': DateTime.now(),
        });

    emit(CreatePostSuccessState());
  }
}
