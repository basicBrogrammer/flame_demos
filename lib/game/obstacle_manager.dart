import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';
import 'package:flame_square/game/game.dart';
import 'package:flame_square/game/obstacle.dart';

class ObstacleManager extends Component with HasGameRef<MyGame> {
  final double bpm;
  final int lanes = 2;
  final double obstacleHeight = 20;
  late final double _obstacleSpeed;
  Random _random = Random();
  double elapsedTime = 0;
  int nextSpawn = 1;

  ObstacleManager(this.bpm) : super() {
    _obstacleSpeed = 3 * this.bpm / 60;
  }

  void _spawnObstacle() {
    print('spawnobstacle');
    var width = gameRef.canvasSize.x / this.lanes;
    var shape = Rectangle(
      position: Vector2(width * _random.nextInt(lanes), 0),
      size: Vector2(width, obstacleHeight),
    );

    var obstacle =
        Obstacle(_obstacleSpeed, shape, Paint()..color = Colors.white);
    gameRef.add(obstacle);
  }

  @override
  void update(double dt) {
    super.update(dt);
    elapsedTime += dt;
    double offset = gameRef.canvasSize.y / (obstacleHeight * _obstacleSpeed);
    // print("Speed: $_obstacleSpeed");
    // print("time: $elapsedTime");
    if (elapsedTime > nextSpawn - offset) {
      print("=" * 30);
      print("time rounded: $elapsedTime");
      print("next spawn: $nextSpawn");
      print("offset: $offset");
      _spawnObstacle();
      nextSpawn += 5;
    }
  }
}
