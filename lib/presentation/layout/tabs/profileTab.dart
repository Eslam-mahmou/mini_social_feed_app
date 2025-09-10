import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/routes_page.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/app_provider/app_config_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AppConfigProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.grayColor,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 24.heightResponsive),
                ElevatedButton.icon(
                  onPressed: () {
                    provider.changeTheme(
                      provider.isDarkMode() ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  icon:const Icon(Icons.brightness_6),
                  label:const Text("Toggle Theme"),
                ),
                SizedBox(height: 16.heightResponsive),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grayColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesPage.signIn);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
