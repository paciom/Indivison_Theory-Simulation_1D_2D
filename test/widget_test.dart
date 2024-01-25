// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in test, use the WidgetTester
// utility in the flutter_test package. For example, we can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

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

import 'AppStateConverter_Tests.dart';
import 'Dot2DConverter_Tests.dart';
import 'DuplicatedPatternFinder_Tests.dart';
import 'PartialParticleGrouper_Tests.dart';
import 'ParticleConverter_Tests.dart';
import 'ParticleFinder_Integration_Tests.dart';
import 'ParticleFinder_Tests.dart';
import 'ParticlePatternChecker_Tests.dart';
import 'PatternFinder_Tests.dart';
import 'PositionTranslator_Tests.dart';

void main() {
  for (var i = 0; i < 80; ++i) {
    print("");
  }
  print(
      "Start tests tests[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[");

  test('Read test file', () async {
    // The path is relative to the project root directory.
    final file = File('test/Data/0000152.0x2.0_20230927-233327_0000000097.z2d');

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
      expect(particles.length, 2);
    } else {
      print('File does not exist');
    }
  });

  ParticleFinder_Integration_Tests().run();
  Dot2DConverter_Tests().main();

  //return;
  ParticleConverter_Tests().main();

  ParticlePatternChecker_Tests().run();

  ParticleFinder_Tests().run();

  PositionTranslator_Tests().run();

  PatternFinder_Tests().run();

  DuplicatedPatternFinder_Tests().run();

  AppStateConverter_Tests().main();

  PartialParticleGrouper_Tests().main();
  //
  //
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const Dot1DApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
