import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: theme.textTheme.bodySmall),
        InkWell(
          onTap: () {},
          child: Text("Sign Up", style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}
