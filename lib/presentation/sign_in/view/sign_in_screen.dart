import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/presentation/sign_in/view/widget/custom_row_button.dart';

import '../../../core/utils/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
        child: Column(
          children: [
            SizedBox(height: 32.heightResponsive),
            Text("Sign In", style: theme.textTheme.titleMedium),
            SizedBox(height: 12.heightResponsive),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Username",
                label: Text("Username"),
              ),
            ),
            SizedBox(height: 12.heightResponsive),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                label: Text("Email"),
              ),
            ),
            SizedBox(height: 12.heightResponsive),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                label: Text("Password"),
              ),
            ),
            SizedBox(height: 12.heightResponsive),
            ElevatedButton(onPressed: () {}, child: Text("Sign In")),
            SizedBox(height: 12.heightResponsive),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.grayColor,
                foregroundColor: AppColors.blackColor,
              ),
              onPressed: () {},
              child: Text("Sign In with Google"),
            ),
            Expanded(child: SizedBox(height: 12.heightResponsive)),
            CustomRowButton(),
            SizedBox(height: 12.heightResponsive),
          ],
        ),
      ),
    );
  }
}
