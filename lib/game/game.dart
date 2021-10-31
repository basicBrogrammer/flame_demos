import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flame/effects.dart';
import 'package:flame/widgets.dart';
import 'package:flame_square/game/obstacle.dart';
import 'package:flutter/material.dart';

class NotePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path mainPath = Path();
    // maybe this should be the polygon?
    mainPath.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.blue.shade700;
    canvas.drawPath(mainPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class MyGame extends FlameGame {
  static const int squareSpeed = 400;
  static final squarePaint = BasicPalette.white.paint();
  late Rect squarePos;
  int squareDirection = 1;

  @override
  bool debugMode = true;

  @override
  Color backgroundColor() {
    return Colors.grey.shade200;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final sprite = await Sprite.load('StreamBeatsNote.png');
    final size = Vector2(60, 85);

    final startPosition = Vector2(canvasSize.x / 2, canvasSize.y / 2);

    final player = SpriteComponent(size: size, sprite: sprite)
      ..anchor = Anchor.center
      ..position = startPosition;

    add(player);
  }
}
