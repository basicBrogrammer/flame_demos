import 'package:flame/components.dart';
import 'package:flame_square/game/game.dart';

class Obstacle extends ShapeComponent with HasGameRef<MyGame> {
  double speed;

  Obstacle(
    this.speed,
    shape,
    shapePaint, {
    Anchor anchor = Anchor.center,
    int? priority,
  }) : super(shape, shapePaint, anchor: anchor, priority: priority);

  @override
  void update(double dt) {
    super.update(dt);

    // remove if the shape has left the screen
    if (this.position.y > gameRef.canvasSize.y) {
      gameRef.remove(this);
    }
  }
}
