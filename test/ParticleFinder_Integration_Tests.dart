import 'dart:io';

import 'package:light_simulator/Generated/AppState.pb.dart' as pbAppStateFile;
import 'package:light_simulator/Simulation2D/ParticleFinding/CollisionDotsFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleGrouper.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleNamer.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticlePatternChecker.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/PatternFinder.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/AppStateConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DMapConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/DotDataConverter.dart';
import 'package:test/test.dart';

class Test {
  final String filename;
  final int expectedParticleCount;

  Test(this.filename, this.expectedParticleCount);
}

class ParticleFinder_Integration_Tests {
  void run() {
    var data = [
      // Test(
      //   "test/Data/0000152.0x2.0_20230927-233327_0000000097.z2d",
      //   2,
      // ),
      // Test(
      //   "test/Data/0004002.0x2.0_20230930-002203_0000005560.z2d",
      //   19,
      // ),
      Test(
        "test/Data/0005003.0x3.0_20230913-223418_0000000730.z2d",
        1,
      ),
    ];

    data.forEach((Test data) {
      test('ParticleFinder_Tests: ${data.filename} should have particles: ${data.expectedParticleCount}', () async {
        // The path is relative to the project root directory.
        final file = File(data.filename);

        if (await file.exists()) {
          final contents = file.readAsBytesSync();
          var pbAppState = pbAppStateFile.AppState.fromBuffer(contents);

          var dot2dConverter = Dot2DConverter();
          var appStateConverter = AppStateConverter(DotDataConverter(Dot2DMapConverter(dot2dConverter)));
          var state = appStateConverter.fromProto(pbAppState);

          var particles = ParticleFinder(
            PatternFinder(DuplicatePatternFinder()),
            CollisionDotsFinder(state),
            ParticleGrouper(ParticleNamer()),
            ParticlePatternChecker(),
          ).findParticles(state.data.dots);

          expect(state.data, isNotNull);
          expect(particles.length, data.expectedParticleCount);
        } else {
          print('File does not exist');
        }
      });
    });
  }
}
