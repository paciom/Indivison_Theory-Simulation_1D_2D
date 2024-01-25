import 'package:light_simulator/Simulation1D/CollisionCheckers/DotCollisionChecker.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';

class DotSureCollisionChecker2 implements DotCollisionChecker {
  @override
  bool isCollided(Dot a, Dot b) {
    var distance = a.position - b.position;
    var collided = (distance == 0 || distance == 1) && (a.speed != b.speed);
    return collided;
  }
}
