import 'package:flutter/material.dart';

final ThemeData basicTheme = _buildBasicTheme();

final Color errorColor = Color(0xFFFF4E4E);
final Color bodyText1Color = Color(0xFF555555);

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
      fontFamily: "OpenSans",
      fontStyle: FontStyle.normal,
      color: Colors.white,
    ),
    bodyText1: base.bodyText1.copyWith(
      fontFamily: "OpenSans",
      color: bodyText1Color,
    ),
  );
}

ThemeData _buildBasicTheme() {
  Color primaryColor = Color(0xFFFF2094);
  Color secondaryColor = Color(0xFFFF31C5);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
