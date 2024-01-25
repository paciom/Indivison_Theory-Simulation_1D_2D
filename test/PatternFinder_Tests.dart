import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/PatternFinder.dart';

class Test {
  final List<int> collidedDotIndex;
  final List<int> expected;

  Test(this.collidedDotIndex, this.expected);
}

class PatternFinder_Tests {
  void run() {
    var data = [
      Test(
        [],
        [],
      ),
      Test(
        [1],
        [],
      ),
      Test(
        [1, 2],
        [],
      ),
      Test(
        [1, 2, 3],
        [],
      ),
      Test(
        [1, 1, 1, 1, 1],
        [1],
      ),
      Test(
        [
          // A
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
          // B
          1, 2, 1, 2, 1, 2, 1, 2, 1, 2,
        ],
        [2],
      ),
      Test(
        [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
        [3], // this "3" means length of the pattern has length of 3 in repeat section: 1,2,3
      ),
      Test(
        [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3],
        [],
      ),
      Test(
        [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4],
        [4], // this "4" means length of the pattern has length of 4 in repeat section: 1,2,3,4
      ),
      Test(
        [
          1,
          2,
          1,
          2,
          3,
          1,
          2,
          1,
          2,
          3,
          1,
          2,
          1,
          2,
          3,
          1,
          2,
          1,
          2,
          3,
          1,
          2,
          1,
          2,
          3,
          4,
          1,
          2,
          3,
          4,
          1,
          2,
          3,
          4,
          1,
          2,
          3,
          4,
          1,
          2,
          3,
          4,
          1,
          2,
          3,
          1,
          2,
          3,
          1,
          2,
          3,
          1,
          2,
          3
        ],
        [], // The repeat circle should start from the last item
      ),
      Test(
        [
          //
          6,
          5,
          4,
          3,
          2,
          1,

          // Repeat circle
          3,
          2,
          1,
          2,
          1,
          // Repeat circle
          3,
          2,
          1,
          2,
          1,
          // Repeat circle
          3,
          2,
          1,
          2,
          1,
          // Repeat circle
          3,
          2,
          1,
          2,
          1,
          // Repeat circle
          3,
          2,
          1,
          2,
          1,
        ],
        [5], // this "5" means length of the pattern has length of 5 in repeat section
      ),
      Test(
        [
          // repeat circle 0
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          3,

          // repeat circle 1
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          3,

          // repeat circle 2
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          3,

          // repeat circle 3
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          3,

          // repeat circle 4
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          3
        ],
        [
          11, // this "11" means length of the pattern has length of 11 in repeat section:1,2,1,2,1,2,1,2,1,2,3
        ],
      ),
      Test(
        [
          // repeat circle 0
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 1
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 2
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 3
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 4
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
        ],
        [
          2, // this "2" means length of the pattern has length of 2 in repeat section: 1,2
          11, // this "11" means length of the pattern has length of 11 in repeat section:1,2,1,2,1,2,1,2,1,2,3
        ],
      ),
      Test(
        [
          // repeat circle 0
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 1
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 2
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,

          // repeat circle 3
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          2, // out of circle
          2,
          1,
          2,

          // repeat circle 4
          3,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
          1,
          2,
        ],
        [
          2, // this "2" means length of the pattern has length of 2 in repeat section: 1,2
        ],
      ),
    ];

    data.forEach((Test data) {
      test('PatternFinder_Tests: CollidedDotIndex: ${data.collidedDotIndex} should be ${data.expected}', () {
        var finder = PatternFinder(DuplicatePatternFinder());
        var result = finder.findPattern(data.collidedDotIndex
            .map((index) => CollisionRecord(
                  index,
                  0,
                  const Offset(0, 0),
                ))
            .toList());
        expect(result, data.expected);
      });
    });
  }
}
