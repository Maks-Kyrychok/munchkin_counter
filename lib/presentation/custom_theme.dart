import 'package:flutter/material.dart';

import 'constant_colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ConstantColors.lightGrey,
      scaffoldBackgroundColor: ConstantColors.darkGrey,
      appBarTheme: const AppBarTheme(backgroundColor: ConstantColors.darkGrey),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: ConstantColors.orange),
        unselectedIconTheme: IconThemeData(color: ConstantColors.beige),
        unselectedItemColor: ConstantColors.beige,
        showSelectedLabels: true,
        selectedItemColor: ConstantColors.orange,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
      ),
      fontFamily: 'munchkin',
      buttonTheme: const ButtonThemeData(
        buttonColor: ConstantColors.beige,
      ),
    );
  }
}
