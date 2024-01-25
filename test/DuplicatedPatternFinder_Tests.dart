import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';

class Test {
  final List<int> collidedDotIndexes;
  final int bigPatternLength;
  final int smallPatternLength;
  final bool isDuplicated;

  Test(this.collidedDotIndexes, this.bigPatternLength, this.smallPatternLength, this.isDuplicated);
}

class DuplicatedPatternFinder_Tests {
  void run() {
    var data = [
      Test(
        [1, 1, 1, 1, 1, 1],
        2,
        1,
        true,
      ),
      Test(
        [
          1, 1, 1, 1,
          //
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
          //
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2
        ],
        4,
        2,
        true,
      ),
      Test(
        [
          3,
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
          //
          3,
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        ],
        11,
        2,
        false,
      ),
      Test(
        [
          3, 4, 3, 4, 3, 4, 3, 4, 3, 4,
          //
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
          ///////////////////////////////

          3, 4, 3, 4, 3, 4, 3, 4, 3, 4,
          //
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        ],
        20,
        2,
        false,
      ),
    ];

    data.forEach((Test data) {
      test(
          'DuplicatedPatternFinder_Tests ${data.collidedDotIndexes}, BigPatternLength: ${data.bigPatternLength}, SmallPatternLength: ${data.smallPatternLength} should be duplicated: ${data.isDuplicated}',
          () {
        var finder = DuplicatePatternFinder();
        var collisionRecords = data.collidedDotIndexes
            .map((index) => CollisionRecord(
                  index,
                  0,
                  const Offset(0, 0),
                ))
            .toList();
        var result = finder.isRepeat(collisionRecords, data.bigPatternLength, data.smallPatternLength);
        expect(result, data.isDuplicated);
      });
    });
  }
}
