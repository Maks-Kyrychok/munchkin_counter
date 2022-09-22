import 'package:flutter/material.dart';
import 'package:munchkin_counter/presentation/constant_colors.dart';
import 'package:munchkin_counter/presentation/custom_icons.dart';
import 'package:munchkin_counter/screens/navigation_screens/add_player_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/dice_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/levels_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/players_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/settings_screen.dart';

// TO DO: make code clean!
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
      bottomNavigationBar: Stack(alignment: Alignment.bottomCenter, children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: const BottomNavigationBarBeckground(),
        ),
        BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIcons.ax,
                    size: 28,
                  ),
                  label: 'Players'),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.fortress, size: 28), label: 'Levels'),
              BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.add,
                  size: 60,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.dice, size: 28), label: 'Dice'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIcons.settings,
                    size: 28,
                  ),
                  label: 'Settings'),
            ]),
      ]),
    );
  }
}

//TO DO: Change shadow.
class BottomNavigationBarBeckground extends StatelessWidget {
  const BottomNavigationBarBeckground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: ConstantColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 15),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2017544);
    path_0.cubicTo(
        0,
        size.height * 0.2017544,
        size.width * 0.07232000,
        size.height * 0.2132412,
        size.width * 0.1186667,
        size.height * 0.2105263);
    path_0.cubicTo(
        size.width * 0.1692629,
        size.height * 0.2075623,
        size.width * 0.1974181,
        size.height * 0.1891825,
        size.width * 0.2480000,
        size.height * 0.1842105);
    path_0.cubicTo(
        size.width * 0.3458987,
        size.height * 0.1745877,
        size.width * 0.4007280,
        size.height * 0.2088149,
        size.width * 0.4986667,
        size.height * 0.2105263);
    path_0.cubicTo(
        size.width * 0.5965787,
        size.height * 0.2122368,
        size.width * 0.6514213,
        size.height * 0.1916316,
        size.width * 0.7493333,
        size.height * 0.1929825);
    path_0.cubicTo(
        size.width * 0.8050587,
        size.height * 0.1937518,
        size.width * 0.8376107,
        size.height * 0.2134368,
        size.width * 0.8933333,
        size.height * 0.2149123);
    path_0.cubicTo(size.width * 0.9355093, size.height * 0.2160289, size.width,
        size.height * 0.2017544, size.width, size.height * 0.2017544);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.2017544);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
