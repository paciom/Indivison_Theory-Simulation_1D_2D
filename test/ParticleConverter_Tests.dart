import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Generated/Particle2D.pb.dart' as pbParticle2D;
import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import 'package:light_simulator/Simulation2D/Models/DotData.dart';
import 'package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart';
import 'package:light_simulator/Simulation2D/Models/Particle.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/ParticleConverter.dart';

class Test {
  final Map<String, Particle> particle;
  final List<pbParticle2D.Particle2D> expected;

  Test(this.particle, this.expected);
}

class ParticleConverter_Tests {
  void main() {
    var dot0 = createDot(0);
    var dot1 = createDot(1);
    var dot2 = createDot(2);
    var dot3 = createDot(3);

    dot0.connectedDotId = dot1.id;
    dot1.connectedDotId = dot0.id;
    dot2.connectedDotId = dot3.id;
    dot3.connectedDotId = dot2.id;

    dot0.collisions.addAll([
      createCollisionRecord(dot1),
      createCollisionRecord(dot2),
    ]);

    dot0.locationSwapHistory.addAll([
      locationSwapRecord(1),
      locationSwapRecord(2),
    ]);

    var state = AppState()
      ..data = (DotData()
        ..dots = {
          0: dot0,
          1: dot1,
          2: dot2,
          3: dot3,
        });

    var data = [
      Test(
        {
          "0,1": Particle()
            ..id = "0,1"
            ..dots = [
              dot0.id,
              dot1.id,
            ],
          "2,3": Particle()
            ..id = "2,3"
            ..dots = [
              dot2.id,
              dot3.id,
            ],
        },
        [pbParticle2D.Particle2D()],
      ),
    ];

    data.forEach((Test testCase) {
      test('ParticleConverter_Tests ', () {
        var converter = ParticleConverter(Dot2DConverter(), state);
        var pbParticle = converter.toParticleMapProto(testCase.particle);
        var convertedBack = converter.fromParticleMapProto(pbParticle);

        expect(convertedBack.toString(), testCase.particle.toString());
      });
    });
  }

  LocationSwapRecord locationSwapRecord(int id) => LocationSwapRecord(Offset(id + 12, id + 43), Offset(id + 98, 23), id + 2);

  Dot2D createDot(int id) => Dot2D(id, Offset(id + 2, id + 3), Offset(id + 7, id + 8))..locationHistory.add(const Offset(8, 9));

  CollisionRecord createCollisionRecord(Dot2D dot) => CollisionRecord(dot.id, dot.id + 23, Offset(dot.id + 29, dot.id + 11));
}
