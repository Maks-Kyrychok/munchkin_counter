import 'dart:math';

import 'package:flutter/material.dart';
import 'package:munchkin_counter/presentation/constant_colors.dart';
import 'package:munchkin_counter/presentation/custom_icons.dart';
import 'package:munchkin_counter/screens/navigation_screens/add_player_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/dice_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/levels_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/players_screen.dart';
import 'package:munchkin_counter/screens/navigation_screens/settings_screen.dart';

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
      appBar: AppBar(),
      body: pages[_selectedIndex],
      bottomNavigationBar: Stack(alignment: Alignment.bottomCenter, children: [
        CustomPaint(
          size: Size(
            width,
            (width * 0.22).toDouble(),
          ),
          painter: BottomNavigationBarBackgroundPainter(shadows: [
            const Shadow(
              offset: Offset(1, -4),
              blurRadius: 5.0,
              color: ConstantColors.shadow,
            )
          ], shapeColor: Colors.grey),
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

class BottomNavigationBarBackgroundPainter extends CustomPainter {
  final Color shapeColor;
  final List<Shadow> shadows;
  final Paint _paint;

  BottomNavigationBarBackgroundPainter(
      {required this.shapeColor, required this.shadows})
      : _paint = Paint()
          ..color = shapeColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.2017544);
    path.cubicTo(
        0,
        size.height * 0.2017544,
        size.width * 0.07232000,
        size.height * 0.2132412,
        size.width * 0.1186667,
        size.height * 0.2105263);
    path.cubicTo(
        size.width * 0.1692629,
        size.height * 0.2075623,
        size.width * 0.1974181,
        size.height * 0.1891825,
        size.width * 0.2480000,
        size.height * 0.1842105);
    path.cubicTo(
        size.width * 0.3458987,
        size.height * 0.1745877,
        size.width * 0.4007280,
        size.height * 0.2088149,
        size.width * 0.4986667,
        size.height * 0.2105263);
    path.cubicTo(
        size.width * 0.5965787,
        size.height * 0.2122368,
        size.width * 0.6514213,
        size.height * 0.1916316,
        size.width * 0.7493333,
        size.height * 0.1929825);
    path.cubicTo(
        size.width * 0.8050587,
        size.height * 0.1937518,
        size.width * 0.8376107,
        size.height * 0.2134368,
        size.width * 0.8933333,
        size.height * 0.2149123);
    path.cubicTo(size.width * 0.9355093, size.height * 0.2160289, size.width,
        size.height * 0.2017544, size.width, size.height * 0.2017544);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.2017544);
    path.close();

    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    for (var color in shadows) {
      canvas.save();
      canvas.translate(color.offset.dx, color.offset.dy);
      canvas.drawShadow(path, color.color, sqrt(color.blurRadius), false);
      canvas.restore();
    }
    canvas.drawPath(path, _paint);

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = ConstantColors.lightGrey;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
