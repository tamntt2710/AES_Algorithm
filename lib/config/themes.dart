import 'package:flutter/material.dart';

import 'colors.dart';

final lightTheme = ThemeData(
    primaryColor: ColorUtils.primaryColor,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    tabBarTheme: TabBarTheme(
        labelColor: Colors.blue,
        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 17),
        unselectedLabelColor: Colors.black),
    dividerColor: Colors.white54,
    fontFamily: 'SFUIDisplay',
    unselectedWidgetColor: ColorUtils.borderColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(primary: ColorUtils.primaryColor));

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  fontFamily: 'SFUIDisplay',
  backgroundColor: Color(0xFF000000),
  dividerColor: Colors.black54,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(secondary: Colors.white),
);
