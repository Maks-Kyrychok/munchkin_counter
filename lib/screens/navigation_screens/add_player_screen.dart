import 'package:flutter/material.dart';
import 'package:munchkin_counter/models/player_model.dart';

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({Key? key}) : super(key: key);

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final _playerNameController = TextEditingController();
  Sex? _sex = Sex.male;
  Color _playerColor = Colors.blue;
  final List<Color> _colorsList = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  @override
  void dispose() {
    _playerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New munchkin'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _playerNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 28,
                    ),
                    child: Text('Sex'),
                  ),
                  RadioListTile<Sex>(
                    title: const Text('Male'),
                    value: Sex.male,
                    groupValue: _sex,
                    onChanged: (Sex? value) {
                      setState(() {
                        _sex = value;
                      });
                    },
                  ),
                  RadioListTile<Sex>(
                    title: const Text('Female'),
                    value: Sex.female,
                    groupValue: _sex,
                    onChanged: (Sex? value) {
                      setState(() {
                        _sex = value;
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 28.0,
                    ),
                    child: Text('Colour'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 24),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _playerColor,
                        items: _colorsList.map((color) {
                          return DropdownMenuItem(
                              value: color,
                              child: PlayerColorCircleWidget(
                                color: color,
                                diametr: 48,
                              ));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _playerColor = value as Color;
                          });
                        },

                        // underline: SizedBox(),
                        dropdownColor: Colors.transparent,
                        iconSize: 0.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class PlayerColorCircleWidget extends StatelessWidget {
  const PlayerColorCircleWidget(
      {Key? key, required this.color, required this.diametr})
      : super(key: key);
  final Color color;
  final double diametr;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diametr,
      width: diametr,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
