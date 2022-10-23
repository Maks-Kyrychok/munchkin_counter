import 'dart:math';

import 'package:flutter/material.dart';

class DiceWidget extends StatefulWidget {
  const DiceWidget({Key? key}) : super(key: key);

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  late int _diceNumber = 1;

  int generateDiceNumber() {
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice')),
      body: GestureDetector(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(88.7),
            child: Image(
                image: AssetImage('lib/assets/images/dice_$_diceNumber.png')),
          ),
        ),
        onTap: () {
          setState(() {
            _diceNumber = generateDiceNumber();
          });
        },
      ),
    );
  }
}
