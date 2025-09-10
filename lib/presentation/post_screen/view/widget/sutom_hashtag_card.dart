import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';

import '../../../../core/utils/app_colors.dart';

class CustomHashtagCard extends StatelessWidget {
  const CustomHashtagCard({super.key, required this.hashtag});
  final String hashtag;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(right: 12.widthResponsive),
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.grayColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          hashtag,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
