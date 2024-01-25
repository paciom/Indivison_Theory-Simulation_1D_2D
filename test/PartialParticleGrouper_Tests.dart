//Implement the "group" function in Grouper class to make all the tests pass. The "group" function should put all the "related" numbers in an array.
// If 2 arrays has same elements, they the 2 arrays are "related. There could be unlimited nmumbers of arrays are "related".

import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Simulation2D/Models/Particle.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleGrouper.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleNamer.dart';

class Test {
  final List<List<int>> partialArrays;
  final List<List<int>> expected;

  Test(this.partialArrays, this.expected);
}

bool deepEquals(List<List<dynamic>> a, List<List<dynamic>> b) {
  if (a.length != b.length) {
    return false;
  }

  for (int i = 0; i < a.length; i++) {
    if (a[i].length != b[i].length) {
      return false;
    }

    for (int j = 0; j < a[i].length; j++) {
      if (a[i][j] != b[i][j]) {
        return false;
      }
    }
  }

  return true;
}

class PartialParticleGrouper_Tests {
  void main() {
    var data = [
      Test(
        [],
        [],
      ),
      Test(
        [
          [1]
        ],
        [
          [1]
        ],
      ),
      Test(
        [
          [1, 2, 3]
        ],
        [
          [1, 2, 3]
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
        ],
        [
          [1, 2, 3],
          [4, 5],
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
          [5, 6],
        ],
        [
          [1, 2, 3],
          [4, 5, 6],
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
          [5, 6],
          [7, 6],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7],
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
          [5, 6],
          [7, 6],
          [7, 8],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8],
        ],
      ),
      Test(
        [
          [7, 6],
          [7, 8],
          [1, 2, 3],
          [4, 5],
          [5, 6],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8],
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
          [5, 6],
          [7, 6],
          [7, 8],
          [8, 9],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8, 9],
        ],
      ),
      Test(
        [
          [1, 2, 3],
          [4, 5],
          [5, 6],
          [7, 6],
          [7, 8],
          [8, 9],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8, 9],
        ],
      ),
      Test(
        [
          [4, 5],
          [5, 6],
          [7, 6],
          [1, 2, 3],
          [7, 8],
          [8, 9],
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8, 9],
        ],
      ),
      Test(
        [
          [4, 5],
          [5, 6],
          [7, 6],
          [1, 2, 3],
          [7, 8],
          [8, 9],
          [9, 10, 11, 12],
          [12, 15, 16],
          [10, 18, 22]
        ],
        [
          [1, 2, 3],
          [4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 18, 22],
        ],
      ),
      Test(
        [
          [33, 42, 53],
          [3, 32, 33],
          [4, 5],
          [5, 6],
          [7, 6],
          [1, 2, 3],
          [7, 8],
          [8, 9],
          [9, 10, 11, 12],
          [12, 15, 16],
          [10, 18, 22]
        ],
        [
          [1, 2, 3, 32, 33, 42, 53],
          [4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 18, 22],
        ],
      ),
      Test(
        [
          [33, 42, 53],
          [3, 32, 33],
          [4, 5],
          [5, 6],
          [7, 6],
          [1, 2, 3],
          [7, 8],
          [8, 9],
          [9, 10, 11, 12],
          [12, 15, 16],
          [10, 18, 22],
          [3, 4]
        ],
        [
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 18, 22, 32, 33, 42, 53],
        ],
      ),
    ];

    data.forEach((Test data) {
      test('PartialParticleGrouper_Tests: Original 2D Arrays: ${data.partialArrays}, Grouped arrays: ${data.expected}', () {
        var grouper = ParticleGrouper(ParticleNamer());
        var partialParticles = data.partialArrays.map((ids) => Particle()..dots.addAll(ids.map((id) => id))).toList();

        var result = grouper.groupParticles(partialParticles).map((particle) => particle.dots.map((dot) => dot).toList()).toList();
        expect(result, data.expected);

        // var result = Grouper().group(data.partialArrays);
        //
        // expect(deepEquals(result, data.expected), true, reason: "Actual: $result");
      });
    });
  }
}
