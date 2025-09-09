import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_social_feed/core/common/responsive_height_width.dart';
import 'package:mini_social_feed/core/di/injectable_initializer.dart';
import 'package:mini_social_feed/core/routes/routes_page.dart';
import 'package:mini_social_feed/core/widget/custom_dialog.dart';
import 'package:mini_social_feed/presentation/auth/manager/auth_cubit.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custom_row_button.dart';
import 'package:mini_social_feed/presentation/auth/view/widget/custon_sign_with_google.dart';

import '../../../core/service/app_vaildate.dart';
import '../manager/auth_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              negativeActionName: "Cancel",

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
                    Text("Sign In", style: theme.textTheme.titleMedium),
                    SizedBox(height: 12.heightResponsive),
                    TextFormField(
                      validator: AppValidate.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        label: Text("Email"),
                      ),
                    ),
                    SizedBox(height: 12.heightResponsive),
                    TextFormField(
                      obscureText: true,
                      validator: AppValidate.validatePassword,
                      controller: viewModel.passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        label: Text("Password"),
                      ),
                    ),
                    SizedBox(height: 12.heightResponsive),
                    ElevatedButton(
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.signInWithEmailAndPassword();
                        }
                      },
                      child: Text("Sign In"),
                    ),

                    SizedBox(height: 12.heightResponsive),
                    CustomSignWithGoogle(text: "Sign In with Google",
                    onTap: () {
                      viewModel.signInWithGoogle();
                    }),
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
            ),
          );
        },
      ),
    );
  }
}
