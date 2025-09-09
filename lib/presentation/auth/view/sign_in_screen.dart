import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/routes/routes_page.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custom_row_button.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custon_sign_with_google.dart';


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
            CustomSignWithGoogle(text: "Sign In with Google",),
            Expanded(child: SizedBox(height: 12.heightResponsive)),
            CustomRowButton(
              text: "Don't have an account?",
              textButton: "Sign Up",
              onTap: () {
                Navigator.pushNamed(context, RoutesPage.signUp);
              },
            ),
            SizedBox(height: 12.heightResponsive),
          ],
        ),
      ),
    );
  }
}
