import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Generated/AppState.pb.dart' as pbAppState;
import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import 'package:light_simulator/Simulation2D/Models/DotData.dart';
import 'package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart';
import 'package:light_simulator/Simulation2D/Models/UiState.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/AppStateConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DMapConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/DotDataConverter.dart';

class Test {
  final AppState appState;
  final pbAppState.AppState expected;

  Test(this.appState, this.expected);
}

class AppStateConverter_Tests {
  void main() {
    var dot0 = createDot(0);
    var dot1 = createDot(1);
    var dot2 = createDot(2);

    dot0.collisions.addAll([
      createCollisionRecord(dot1),
      createCollisionRecord(dot2),
    ]);

    dot0.locationSwapHistory.addAll([
      locationSwapRecord(1),
      locationSwapRecord(2),
    ]);

    var data = [
      Test(
        AppState()
          ..data = (DotData()
            ..dots = {0: dot0, 1: dot1, 2: dot2}
            ..time = 3
            ..numberOfDots = 3
            ..seed = 6
            ..collisionRadius = 0.5
            ..initialAreaHeight = 4
            ..initialAreaWidth = 7)
          ..ui = (UiState()
            ..scaleCenter = const Offset(3, 9)
            ..scale = 4
            ..showPositionHistory = true
            ..size = const Size(800, 900)
            ..showConnection = true
            ..running = true
            ..maxTrailAge = 1001
            ..panCenter = const Offset(12, 23)
            ..dotPaintRadius = 28
            ..scale = 84),
        pbAppState.AppState(),
      ),
    ];

    data.forEach((Test testCase) {
      test('AppStateConverter_Tests: ${testCase.appState} should be ${testCase.expected}', () {
        var dot2dConverter = Dot2DConverter();
        var converter = AppStateConverter(DotDataConverter(Dot2DMapConverter(dot2dConverter)));
        var pbAppStateResult = converter.toProto(testCase.appState);
        var convertedBack = converter.fromProto(pbAppStateResult);

        //var expected = testCase.expected;
        var data = testCase.appState.data;
        var data2 = convertedBack.data;

        expect(testCase.appState.toString(), convertedBack.toString());

        expect(data2.initialAreaWidth, data.initialAreaWidth);
        expect(data2.initialAreaHeight, data.initialAreaHeight);
        expect(data2.collisionRadius, data.collisionRadius);
        expect(data2.seed, data.seed);
        expect(data2.numberOfDots, data.numberOfDots);
        expect(data2.time, data.time);

        expect(data2.dots.length, data.dots.length);

        //expect(data2.dots[0], data.dots[0]);
        //expect(data2.dots[0] == data.dots[0], true);
        //expect(data2.dots == data.dots, true);
        //expect(data2, data);
        //expect(data2 == data, true);

        var dot0 = data.dots[0];
        var dot20 = data2.dots[0];
        //
        // if (dot20 != null && dot20. locationSwapHistory != null) {
        //   var locationSwapHistory = dot20.locationSwapHistory;
        //
        //   expect(locationHistory.length,locationHistory.length);
        //   expect(locationHistory[0].dx, locationHistory[0].dx);
        //   expect(locationHistory[0].dy, dot0.locationHistory[0].dy);
        //   expect(locationHistory[0] == dot0.locationHistory[0], true);
        //   expect(locationHistory.length, 1);
        //   expect(locationHistory.toString(), dot0.locationHistory.toString());
        //   expect(dot20.toString(), dot0.toString());
        //   //expect(dot20 == dot0, true);
        //   //expect(dot20.collisions[0].dot, dot0.collisions[0].dot);
        //   //expect(dot20.collisions[0].dot, dot0.collisions[0].dot);
        //   // expect(dot20.collisions[0].dot.id, dot0.collisions[0].dot.id);
        //   // expect(dot20.collisions[0].dot.position, dot0.collisions[0].dot.position);
        //   // expect(dot20.collisions[0].dot.direction, dot0.collisions[0].dot.direction);
        //   // expect(dot20.collisions[0].dot.id, 1);
        //   // expect(dot20.collisions[0].dot.position, dot0.collisions[0].dot.position);
        //   // expect(dot20.collisions[0].dot.collisions.length, dot0.collisions[0].dot.collisions.length);
        //   // expect(dot20.collisions[0].dot.collisions.length, 0);
        //   // expect(dot20.collisions, dot0.collisions);
        //   // expect(dot20.locationHistory, dot0.locationHistory);
        //   // expect(dot20.locationHistory, dot0.locationHistory);
        //   // expect(dot20.locationHistory, dot0.locationHistory);
        //   // expect(dot20.locationHistory, dot0.locationHistory);
        //   // expect(testCase.appState.frozenParticles.length, testCase.expected.particles.length);
        //   // expect(testCase.appState.frozenParticles.length, 2);
        // }
      });
    });
  }

  LocationSwapRecord locationSwapRecord(int id) => LocationSwapRecord(Offset(id + 12, id + 43), Offset(id + 98, 23), id + 2);

  Dot2D createDot(int id) => Dot2D(id, Offset(id + 2, id + 3), Offset(id + 7, id + 8))..locationHistory.add(const Offset(8, 9));

  CollisionRecord createCollisionRecord(Dot2D dot) => CollisionRecord(dot.id, dot.id + 23, Offset(dot.id + 29, dot.id + 11));
}
