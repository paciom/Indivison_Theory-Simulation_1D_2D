import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';

class DuplicatePatternFinder {
  bool isRepeat(List<CollisionRecord> ids, int bigPatternLength, int smallPatternLength) {
    if (bigPatternLength % smallPatternLength != 0) {
      return false;
    }

    for (var i = 0; i < bigPatternLength; ++i) {
      var lastIndex = ids.length - 1;
      var bigPatternItem = ids[lastIndex - i];
      var smallPatternItem = ids[lastIndex - (i % smallPatternLength)];
      if (bigPatternItem.dotId != smallPatternItem.dotId) {
        return false;
      }
    }

    return true;
  }
}
