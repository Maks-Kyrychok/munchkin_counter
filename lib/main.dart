import 'package:flutter/material.dart';
import 'package:munchkin_counter/presentation/custom_theme.dart';

import 'Screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
      theme: CustomTheme.darkTheme, home: const MainScreenWidget()));
}
