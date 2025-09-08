import 'package:flutter/material.dart';

void main() {
  runApp(const MiniSocialFeedApp());
}
class MiniSocialFeedApp extends StatelessWidget {
  const MiniSocialFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Social Feed',
      debugShowCheckedModeBanner: false,

    );
  }
}
