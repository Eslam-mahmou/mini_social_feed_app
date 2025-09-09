import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/di/injectable_initializer.dart';
import 'package:mini_social_feed/presentation/auth/manager/auth_cubit.dart';
import 'package:mini_social_feed/presentation/auth/manager/auth_state.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custom_row_button.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custon_sign_with_google.dart';

import '../../../core/routes/routes_page.dart';
import '../../../core/widget/custom_dialog.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt.get<AuthViewModel>(),
      child: BlocConsumer<AuthViewModel, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            EasyLoading.show();
          }
          if (state is AuthErrorState) {
            EasyLoading.dismiss();
            DialogUtils.showMessage(
              context: context,
              message: state.message,
              title: "Error",
              negativeActionName: "Cancel"
            );
          }
          if (state is AuthSuccessState) {
            EasyLoading.dismiss();
            DialogUtils.showMessage(
              context: context,
              message: "Login Successfully",
              title: "Success",
              postActionName: "Ok",
              negativeActionName: "Cancel",
              postAction: () {
                Navigator.pushReplacementNamed(context, RoutesPage.feed);
              },
            );
          }
        },
        builder: (context, state) {
          final viewModel = context.read<AuthViewModel>();
          return Form(
            key: viewModel.formKey,
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.widthResponsive),
                child: Column(
                  children: [
                    SizedBox(height: 32.heightResponsive),
                    Text("Create an account",
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 12.heightResponsive),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: viewModel.usernameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        label: Text("Username"),
                      ),
                    ),
                    SizedBox(height: 12.heightResponsive),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        label: Text("Email"),
                      ),
                    ),
                    SizedBox(height: 12.heightResponsive),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: viewModel.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(height: 12.heightResponsive),
                    ElevatedButton(onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.signUpWithEmailAndPassword();
                      }
                    }, child: Text("Sign Up")),
                    SizedBox(height: 12.heightResponsive),
                    CustomSignWithGoogle(text: "Sign Un with Google",
                        onTap: () {
                          viewModel.signInWithGoogle();
                        }),
                    Expanded(child: SizedBox(height: 12.heightResponsive)),
                    CustomRowButton(
                        text: "Already have an account?",
                        textButton: "Login",
                        onTap: () {
                          Navigator.pop(context);
                        }
                    ),
                    SizedBox(height: 12.heightResponsive),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
