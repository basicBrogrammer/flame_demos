import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  @override
  bool debugMode = true;

  @override
  Color backgroundColor() {
    return Colors.grey.shade200;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }
}
