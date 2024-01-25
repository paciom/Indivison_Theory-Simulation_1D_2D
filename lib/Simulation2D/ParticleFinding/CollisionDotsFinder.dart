import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

class CollisionDotsFinder {
  final AppState _state;

  CollisionDotsFinder(this._state);

  List<Dot2D> findCollidedDots(int startingDotId, List<int> searchedList, int time) {
    if (searchedList.any((dotId) => dotId == startingDotId)) {
      return [];
    } else {
      searchedList.add(startingDotId);
      List<Dot2D> results = [];
      var dot = _state.data.dots[startingDotId]!;
      for (var i = dot.collisions.length - 1; i >= 0; --i) {
        var collidedDot = dot.collisions[i];
        if (collidedDot.time < time) {
          break;
        }
        var otherCollidedDots = findCollidedDots(collidedDot.dotId, searchedList, time);
        results.addAll(otherCollidedDots);
      }
      return results;
    }
  }
}
