import 'package:light_simulator/Simulation1D/CollisionCheckers/DotCollisionChecker.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';

class CollisionChecker {
  final DotCollisionChecker _dotCollisionChecker;

  CollisionChecker(this._dotCollisionChecker);

  List<List<Dot>> getCollidingPairs(List<Dot> dots) {
    List<List<Dot>> pairs = [];
    List<Dot> checkedDots = [];

    for (var i = 0; i < dots.length - 1; i++) {
      for (var j = i + 1; j < dots.length; j++) {
        var a = dots[i];
        var b = dots[j];
        bool collided = _dotCollisionChecker.isCollided(a, b);
        if (collided) {
          if (!checkedDots.contains(a) && !checkedDots.contains(b)) {
            checkedDots.add(a);
            checkedDots.add(b);
            pairs.add([a, b]);
          }
        }
      }
    }

    return pairs;
  }
}
