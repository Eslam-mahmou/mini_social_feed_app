import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSignWithGoogle extends StatelessWidget {
  const CustomSignWithGoogle({super.key,required this.text,required this.onTap});
final String text;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.grayColor,
        foregroundColor: AppColors.blackColor,
      ),
      onPressed:onTap,
      child: Text(text),
    )
    ;
  }
}
