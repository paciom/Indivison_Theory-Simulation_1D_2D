import 'dart:math' show Random, max, min;

import '../Dot.dart';
import '../Settings.dart';
import 'DotCollisionChecker.dart';

class PercentageCollisionChecker implements DotCollisionChecker {
  final Random _random;
  final Settings _settings;

  PercentageCollisionChecker(this._settings, this._random);

  @override
  bool isCollided(Dot a, Dot b) {
    var ma = max(a.position, b.position);
    var mi = min(a.position, b.position);
    var distance = ma - mi;
    var collided = (distance == 0 || distance == 1) && (a.speed != b.speed) && _random.nextDouble() < _settings.collisionPercentage;
    return collided;
  }
}
