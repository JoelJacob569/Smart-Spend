import 'package:flutter/material.dart';
import 'package:smartspend/utils/themes/custom_themes/appbar_theme.dart';
import 'package:smartspend/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:smartspend/utils/themes/custom_themes/text_field_theme.dart';
import 'package:smartspend/utils/themes/custom_themes/text_theme.dart';

import '../constants/colors.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SColors.grey,
    brightness: Brightness.light,
    primaryColor: SColors.primary,
    textTheme: STextTheme.lightTextTheme,
    scaffoldBackgroundColor: SColors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SColors.grey,
    brightness: Brightness.dark,
    primaryColor: SColors.primary,
    textTheme: STextTheme.darkTextTheme,
    scaffoldBackgroundColor: SColors.black,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}
