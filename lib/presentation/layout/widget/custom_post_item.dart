import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/utils/app_colors.dart';

import '../../../domain/entity/past_response_Entity.dart';

class CustomPostItem extends StatelessWidget {
  const CustomPostItem({
    super.key,
    required this.post,
    required this.onLikePressed,
    required this.isLiked,
  });

  final PostResponseEntity post;
  final VoidCallback onLikePressed;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    final imageBytes = base64Decode(post.imageUrl ?? "");
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageBytes.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.memory(
                  imageBytes,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              )
            : SizedBox(),
        SizedBox(height: 16.heightResponsive),
        Text(post.title, style: theme.textTheme.bodyMedium),
        SizedBox(height: 4.heightResponsive),
        Text(post.description, style: theme.textTheme.bodySmall),
        SizedBox(height: 4.heightResponsive),
        Text("${post.likes.length} Likes", style: theme.textTheme.bodySmall),
        SizedBox(height: 32.heightResponsive),
        Row(
          children: [
            GestureDetector(
              onTap: onLikePressed,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isLiked
                      ? AppColors.primaryColor.withOpacity(0.1)
                      : Colors.transparent,
                ),
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor,
                  size: 24,
                ),
              ),
            ),
            SizedBox(width: 8.widthResponsive),
            Text(
              post.likes.length.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: isLiked
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        SizedBox(width: 12.heightResponsive),

      ],
    );
  }
}
