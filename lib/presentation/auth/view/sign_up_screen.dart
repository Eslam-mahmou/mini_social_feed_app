import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custom_row_button.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custon_sign_with_google.dart';

import '../../../core/routes/routes_page.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
        child: Column(
          children: [
            SizedBox(height: 32.heightResponsive),
            Text("Create an account", style: theme.textTheme.titleMedium),
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
            ElevatedButton(onPressed: () {}, child: Text("Sign Un")),
            SizedBox(height: 12.heightResponsive),
            CustomSignWithGoogle(text: "Sign Un with Google",),
            Expanded(child: SizedBox(height: 12.heightResponsive)),
            CustomRowButton(
              text: "Already have an account?",
              textButton: "Login",
              onTap: () {
                Navigator.pushNamed(context, RoutesPage.signIn);
              }
            ),
            SizedBox(height: 12.heightResponsive),
          ],
        ),
      ),
    );
  }
}
