class PlayerModel {
  String name;
  int lvl = 1;
  int loot = 0;
  Sex sex;
  PlayerColor playerColor;

  PlayerModel({
    required this.name,
    required this.lvl,
    required this.loot,
    required this.sex,
    required this.playerColor,
  });
}

enum Sex {
  male,
  famele,
}

enum PlayerColor {
  red,
  green,
  blue,
  yellow,
  pink,
  orange,
}
