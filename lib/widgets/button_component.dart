import 'package:flame/extensions.dart';
import 'package:flame/input.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget spriteButtonBuilder(String text, VoidCallback onPress) {
  return Container(
    child: SpriteButton.asset(
      path: 'buttons.png',
      pressedPath: 'buttons.png',
      srcPosition: Vector2(0, 0),
      srcSize: Vector2(60, 20),
      pressedSrcPosition: Vector2(0, 20),
      pressedSrcSize: Vector2(60, 20),
      onPressed: onPress,
      label: Text(
        text,
        style: TextStyle(color: Color(0xFF5D275D)),
      ),
      width: 150,
      height: 75,
    ),
  );
}
