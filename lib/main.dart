//region imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:fitness_theme/main/store/AppStore.dart';
import 'package:fitness_theme/main/utils/AppTheme.dart';
import 'package:fitness_theme/theme6/screens/T6Dashboard.dart';
import 'package:fitness_theme/theme6/screens/T6SignIn.dart';

import 'main/utils/AppConstant.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

int currentIndex = 0;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  appStore.toggleDarkMode(value: true);

  if (isMobile) {
    await Firebase.initializeApp();
    MobileAds.instance.initialize();
  }

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (locale, supportedLocales) =>
            Locale(appStore.selectedLanguage),
        locale: Locale(appStore.selectedLanguage),
        supportedLocales: [Locale('en', '')],
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: T6SignIn(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        builder: scrollBehaviour(),
      ),
    );
  }
}
