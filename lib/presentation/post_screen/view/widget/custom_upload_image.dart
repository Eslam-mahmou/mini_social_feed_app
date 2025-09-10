import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_provider/app_config_provider.dart';
import '../../../../core/utils/app_colors.dart';

class CustomUploadImage extends StatelessWidget {
   CustomUploadImage({super.key,required this.onPressed});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    bool isDarkMode = provider.isDarkMode();
    final theme = Theme.of(context);
    return DottedBorder(
      color: AppColors.grayColor,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [6, 3],
      child: Container(
        height: 220.heightResponsive,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Upload Image", style: theme.textTheme.bodyMedium),
            SizedBox(height: 8.heightResponsive),
            Text(
              "Drag and drop or click to upload",
              style: theme.textTheme.bodySmall?.copyWith(
                color:isDarkMode? AppColors.blackColor: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 24.heightResponsive),
            FilledButton(
              onPressed: onPressed,
              child: Text(
                "Upload",
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14,
                color:isDarkMode? AppColors.whiteColor: AppColors.blackColor,),
              ),
            ),
          ],
        ),
        //
      ),
    );
  }
}
