import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticlePatternChecker.dart';

class Test {
  final List<int> particleDotIds;
  final Map<int, List<int>> patterns;
  final bool expected;

  Test(this.particleDotIds, this.patterns, this.expected);
}

class ParticlePatternChecker_Tests {
  void run() {
    var data = [
      // Test(
      //   [],
      //   [],
      // ),
      // Test(
      //   [[]],
      //   [],
      // ),
      Test(
        [0, 1],
        {
          0: [1, 2],
          1: [1, 2],
        },
        true,
      ),
      Test(
        [0, 1],
        {
          0: [1, 2],
          1: [1],
        },
        true,
      ),
      Test(
        [0, 1],
        {
          0: [1, 2],
          1: [2],
        },
        true,
      ),
      Test(
        [0, 1],
        {
          0: [2],
          1: [2],
        },
        true,
      ),
      Test(
        [0, 1],
        {
          0: [1, 2],
          1: [],
        },
        false,
      ),
      Test(
        [0, 1],
        {
          0: [1],
          1: [],
        },
        false,
      ),
    ];

    data.forEach((Test data) {
      test('ParticlePatternChecker_Tests: ${data.patterns} should have particles: ${data.expected}', () {
        var checker = ParticlePatternChecker();
        var result = checker.isPatternsValid(data.particleDotIds, data.patterns);
        expect(result, data.expected);
      });
    });
  }
}
