import 'package:flutter/material.dart';
import 'package:munchkin_counter/presentation/custom_icons.dart';
import 'package:munchkin_counter/screens/navigation_screens/add_player_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/dice_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/levels_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/players_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/settings_screen.dart';

import '../presentation/constant_colors.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;
  List pages = [
    const PLayersScreen(),
    const LevelScreen(),
    const AddPlayerScreen(),
    const DiceScreen(),
    const SettigsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
         
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.ax), label: 'Players'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.fortress), label: 'Levels'),
            BottomNavigationBarItem(
              icon: Icon(
                CustomIcons.add,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.dice), label: 'Dice'),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.settings), label: 'Settings'),
          ]),
    );
  }
}
