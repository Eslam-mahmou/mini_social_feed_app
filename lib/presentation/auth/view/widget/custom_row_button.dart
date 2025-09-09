import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({super.key,required this.text,required this.textButton,
  required this.onTap});
  final String text;
  final String textButton;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: theme.textTheme.bodySmall),
        InkWell(
          onTap: onTap,
          child: Text(textButton, style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }
}
