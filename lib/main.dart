import 'package:flutter/material.dart';

void main() {
  runApp(const MainScreenWidget());
}

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  List<PlayerCardWidget> playersList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Munchkin'),
          centerTitle: true,
        ),
        body: Column(children: playersList),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                playersList.length < 6
                    ? playersList.add(const PlayerCardWidget())
                    : null;
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class PlayerCardWidget extends StatelessWidget {
  const PlayerCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Player name'),
        subtitle: const Text('lvl'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.shield_outlined)),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
