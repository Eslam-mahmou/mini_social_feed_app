import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_social_feed/core/utils/app_theme.dart';
import 'package:mini_social_feed/firebase_options.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'core/di/injectable_initializer.dart';
import 'core/routes/routes_generator.dart';
import 'core/routes/routes_page.dart';
import 'core/service/bloc_observer.dart';
import 'core/service/easy_loading_service.dart';
import 'core/service/screen_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MobileAds.instance.initialize();
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
      builder: (context, child) {
        ScreenSizeService.init(context);
        return EasyLoading.init()(context, child);
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: RoutesPage.signIn,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
