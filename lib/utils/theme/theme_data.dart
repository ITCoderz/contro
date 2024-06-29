import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightViewTheme = ThemeData(
    fontFamily: "SfProText",
    scaffoldBackgroundColor: CColors.scaffoldColor,
    useMaterial3: true,
  );

  static systemOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: CColors.scaffoldColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: CColors.scaffoldColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
