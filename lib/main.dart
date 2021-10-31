import 'package:flame/game.dart';
import 'package:flame_square/game/game.dart';
import 'package:flutter/material.dart';

void main() {
  final myGame = MyGame();
  runApp(GameWidget(game: myGame));
}
