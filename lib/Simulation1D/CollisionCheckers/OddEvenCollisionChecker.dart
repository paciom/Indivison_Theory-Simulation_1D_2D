import 'package:light_simulator/Simulation1D/CollisionCheckers/DotCollisionChecker.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';

class OddEvenCollisionChecker implements DotCollisionChecker {
  @override
  bool isCollided(Dot a, Dot b) {
    var collided = (a.position == b.position) && (a.speed != b.speed);
    return collided;
  }
}
