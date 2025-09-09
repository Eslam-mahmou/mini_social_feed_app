import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSignWithGoogle extends StatelessWidget {
  const CustomSignWithGoogle({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.grayColor,
        foregroundColor: AppColors.blackColor,
      ),
      onPressed: () {},
      child: Text(text),
    )
    ;
  }
}
