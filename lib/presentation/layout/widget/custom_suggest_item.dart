import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/domain/entity/user_data_response_entity.dart';

import '../../../core/utils/app_colors.dart';

class CustomSuggestItem extends StatelessWidget {
   CustomSuggestItem({super.key, required this.usersDataEntity});

  UsersDataEntity usersDataEntity;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: .62,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: usersDataEntity.image ?? "",
            width: 128.widthResponsive,
            height: 128.heightResponsive,
            imageBuilder: (context, imageProvider) => Container(
              width: 128.widthResponsive,
              height: 128.heightResponsive,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) =>
                CircularProgressIndicator(color: AppColors.primaryColor),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 12.heightResponsive),
          Text(
            usersDataEntity.firstName ?? "",
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          Text(
            usersDataEntity.username ?? "",
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
