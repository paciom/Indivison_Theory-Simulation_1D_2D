import 'dart:math' show max, min;

import 'package:light_simulator/Simulation1D/CollisionCheckers/DotCollisionChecker.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';

class DotSureCollisionChecker implements DotCollisionChecker {
  @override
  bool isCollided(Dot a, Dot b) {
    var ma = max(a.position, b.position);
    var mi = min(a.position, b.position);
    var distance = ma - mi;
    var collided = (distance == 0 || distance == 1) && (a.speed != b.speed);
    return collided;
  }
}
