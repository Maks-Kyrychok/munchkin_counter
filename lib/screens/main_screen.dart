import 'package:flutter/material.dart';
import 'package:munchkin_counter/presentation/constant_colors.dart';
import 'package:munchkin_counter/presentation/custom_icons.dart';
import 'package:munchkin_counter/screens/navigation_screens/add_player_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/dice_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/levels_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/players_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/settings_screen.dart';
import 'package:munchkin_counter/screens/widgets/bottom_background_painter_widget.dart';

class BottomItemData {
  final IconData icon;
  final double size;
  final String label;
  BottomItemData(this.icon, this.size, this.label);
}

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

  List<BottomItemData> data = [
    BottomItemData(CustomIcons.ax, 28.0, 'Players'),
    BottomItemData(CustomIcons.fortress, 28.0, 'Levels'),
    BottomItemData(CustomIcons.add, 60.0, ''),
    BottomItemData(CustomIcons.dice, 28.0, 'Dice'),
    BottomItemData(CustomIcons.settings, 28.0, 'Settings'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Stack(alignment: Alignment.bottomCenter, children: [
        CustomPaint(
          size: Size(
            width,
            (width * 0.2).toDouble(),
          ),
          painter: BottomBackgroundPainterWidget(
            shadows: [
              const Shadow(
                offset: Offset(1, -4),
                blurRadius: 4.0,
                color: ConstantColors.shadow,
              )
            ],
            shapeColor: ConstantColors.shadow,
            bottomColor: ConstantColors.lightGray,
          ),
        ),
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: data
                .map((data) => BottomNavigationBarItem(
                    icon: Icon(data.icon, size: data.size), label: data.label))
                .toList()),
      ]),
    );
  }
}
