import 'package:flutter/material.dart';

import 'constant_colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ConstantColors.lightGrey,
      scaffoldBackgroundColor: ConstantColors.darkGrey,
      appBarTheme: const AppBarTheme(backgroundColor: ConstantColors.lightGrey),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: ConstantColors.orange),
        unselectedIconTheme: IconThemeData(color: ConstantColors.beige),
        unselectedItemColor: ConstantColors.beige,
        showSelectedLabels: true,
        selectedItemColor: ConstantColors.orange,
        backgroundColor: ConstantColors.transparent,
        elevation: 0.0,
      ),
      fontFamily: 'munchkin',
      buttonTheme: const ButtonThemeData(
        buttonColor: ConstantColors.beige,
      ),
    );
  }
}
