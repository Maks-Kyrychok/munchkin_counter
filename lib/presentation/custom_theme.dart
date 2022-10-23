import 'package:flutter/material.dart';

import 'constant_colors.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: ConstantColors.lightGray,
        scaffoldBackgroundColor: ConstantColors.darkGray,
        appBarTheme: const AppBarTheme(
            backgroundColor: ConstantColors.darkGray,
            elevation: 0.0,
            shadowColor: Colors.transparent),
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
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColors.whiteGray)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ConstantColors.whiteGray)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return ConstantColors.gray.withOpacity(.32);
            }
            return ConstantColors.gray;
          }),
        ),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white, fontSize: 16),
          subtitle2: TextStyle(color: Colors.white, fontSize: 14),
          bodyText2: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
