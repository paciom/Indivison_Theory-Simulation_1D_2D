import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';

class PatternFinder {
  final int REPEAT_TIMES = 5;
  final DuplicatePatternFinder _duplicatePatternFinder;

  PatternFinder(this._duplicatePatternFinder);

  List<int> findPattern(List<CollisionRecord> ids) {
    int maxPatternLength = (ids.length / REPEAT_TIMES).truncate();
    List<int> foundPatternLengths = [];
    for (var patternLength = 1; patternLength <= maxPatternLength; ++patternLength) {
      bool allCirclesEqual = true;
      for (var i = 0; i < patternLength; ++i) {
        // Implemented PatternFinder_Tests counting from the end of the list because the end of the list is the latest
        int lastIndex = ids.length - 1 - i;
        var lastId = ids[lastIndex].dotId;
        if (lastId != ids[lastIndex - patternLength].dotId ||
            lastId != ids[lastIndex - patternLength * 2].dotId ||
            lastId != ids[lastIndex - patternLength * 3].dotId ||
            lastId != ids[lastIndex - patternLength * 4].dotId) {
          allCirclesEqual = false;
          break;
        }
      }

      if (allCirclesEqual) {
        if (foundPatternLengths.isEmpty) {
          foundPatternLengths.add(patternLength);
        } else {
          var currentFountPatterns = [...foundPatternLengths];
          for (var currentPatternLength in currentFountPatterns) {
            if (!_duplicatePatternFinder.isRepeat(ids, patternLength, currentPatternLength)) {
              foundPatternLengths.add(patternLength);
            }
          }
        }
      }
    }
    return foundPatternLengths;
  }
}
