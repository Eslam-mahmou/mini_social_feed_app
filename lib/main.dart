import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_social_feed/core/utils/app_theme.dart';

import 'core/di/injectable_initializer.dart';
import 'core/routes/routes_generator.dart';
import 'core/routes/routes_page.dart';
import 'core/service/bloc_observer.dart';
import 'core/service/easy_loading_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  configureDependencies();
  runApp(const MiniSocialFeedApp());
}


class MiniSocialFeedApp extends StatelessWidget {
  const MiniSocialFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Social Feed',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: RoutesPage.signIn,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
