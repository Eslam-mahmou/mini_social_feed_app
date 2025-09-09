import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/utils/app_colors.dart';

class DialogUtils {
  static showLoading({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 50,
          ),
          content: Row(
            children: [
              const CircularProgressIndicator(color: AppColors.primaryColor),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static showMessage({
    required BuildContext context,
    required String message,
    String title = "",
    String? postActionName,
    void Function()? postAction,
    String? negativeActionName,
    void Function()? negativeAction,
  }) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            postAction?.call();
          },
          child: Text(
            postActionName,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
        ),
      );
      if (negativeActionName != null) {
        actions.add(
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              negativeAction?.call();
            },
            child: Text(
              negativeActionName,
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ),
        );
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          title: Text(title),
          actions: actions,
        );
      },
    );
  }
}
