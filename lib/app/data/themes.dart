import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_rimba/app/data/colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(primary: primaryYellow),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryYellow,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: primaryBlack,
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: primaryBlack,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: primaryBlack,
        fontSize: 14.0,
      ),
      bodyMedium: TextStyle(
        color: primaryBlack,
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(
        color: primaryBlack,
        fontSize: 14.0,
      ),
    ),
    dialogTheme: const DialogTheme(
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: primaryBlack,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.0,
        color: primaryBlack,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: primaryBlack,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14.0,
        color: primaryBlack,
      ),
    ),
  );
}
