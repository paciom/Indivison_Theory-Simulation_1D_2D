import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import 'package:light_simulator/Simulation2D/Models/DotData.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/CollisionDotsFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleGrouper.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleNamer.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticlePatternChecker.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/PatternFinder.dart';

class Test {
  /**
   * Each list belong to a dot, each element is a collided dot id
   */
  final List<List<int>> dots;
  final List<String> expected;

  Test(this.dots, this.expected);
}

class ParticleFinder_Tests {
  void run() {
    var data = [
      Test(
        [],
        [],
      ),
      Test(
        [[]],
        [],
      ),
      Test(
        [
          [1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0],
        ],
        ["0,1"],
      ),
      Test(
        [
          [1, 1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0, 2],
          [],
        ],
        [],
      ),
    ];

    data.forEach((Test data) {
      test('ParticleFinder_Tests: ${data.dots} should have particles: ${data.expected}', () {
        var state = AppState()..data = (DotData());
        for (var i = 0; i < data.dots.length; ++i) {
          var dot = Dot2D(i, const Offset(0, 0), const Offset(0, 0));
          state.data.dots[i] = dot;
        }
        var finder = ParticleFinder(
          PatternFinder(DuplicatePatternFinder()),
          CollisionDotsFinder(state),
          ParticleGrouper(ParticleNamer()),
          ParticlePatternChecker(),
        );
        Map<int, Dot2D> dots = {};
        for (var i = 0; i < data.dots.length; ++i) {
          var dot = Dot2D(i, const Offset(0, 0), const Offset(0, 0));

          dots[i] = dot;
        }
        for (var i = 0; i < data.dots.length; ++i) {
          var dotsCollidedIds = data.dots[i];

          int id = dots.keys.elementAt(i);
          var dot = dots[id]!;
          for (var j = 0; j < dotsCollidedIds.length; ++j) {
            int collidedDotId = dotsCollidedIds[j];
            Dot2D collidedDot = dots[collidedDotId]!;
            var collision = CollisionRecord(collidedDot.id, j, const Offset(0, 0));
            dot.collisions.add(collision);
          }
        }

        var result = finder.findParticles(dots);
        var particleIds = result.map((e) => e.id).toList();
        expect(particleIds, data.expected);
      });
    });
  }
}
