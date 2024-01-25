import 'dart:math';

import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

import '../CollisionChecker.dart';

class DotGroupFinder {
  List<Dot2D> findGroup(Dot2D dot, int swapHistoryLength) {
    List<Dot2D> searchedDots = [];

    List<Collision> collisions = [];

    int lastRecordIndex = dot.locationSwapHistory.length - swapHistoryLength;
    lastRecordIndex = max(lastRecordIndex, 0);
    var lastRecord = dot.locationSwapHistory[lastRecordIndex];
    int lastRecordTime = lastRecord.time;

    for (var i = dot.collisions.length - 1; i >= 0; --i) {
      var collision = dot.collisions[i];

      //collision.
      var o = searchedDots[i];
    }

    return [];
  }
}
