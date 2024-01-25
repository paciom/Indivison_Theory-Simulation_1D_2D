import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Generated/Particle2D.pb.dart' as pbParticle2D;
import 'package:light_simulator/Simulation2D/Models/CollisionRecord.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import 'package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart';

class Test {
  final Dot2D dot;
  final List<pbParticle2D.Particle2D> expected;

  Test(this.dot, this.expected);
}

class Dot2DConverter_Tests {
  void main() {
    var dot0 = createDot(0);
    var dot1 = createDot(1);

    dot0.connectedDotId = dot1.id;
    dot1.connectedDotId = dot0.id;

    dot0.collisions.addAll([
      createCollisionRecord(dot1),
    ]);

    dot0.locationSwapHistory.addAll([
      locationSwapRecord(1),
      locationSwapRecord(2),
    ]);

    var data = [
      Test(
        dot0,
        [pbParticle2D.Particle2D()],
      ),
    ];

    data.forEach((Test testCase) {
      test('Dot2DConverter_Tests ', () {
        var converter = Dot2DConverter();
        var pbDot = converter.toProto(testCase.dot);
        var convertedBack = converter.fromProto(pbDot);

        expect(convertedBack.toString(), testCase.dot.toString());
      });
    });
  }

  LocationSwapRecord locationSwapRecord(int id) => LocationSwapRecord(Offset(id + 12, id + 43), Offset(id + 98, 23), id + 2);

  Dot2D createDot(int id) => Dot2D(id, Offset(id + 2, id + 3), Offset(id + 7, id + 8))..locationHistory.add(const Offset(8, 9));

  CollisionRecord createCollisionRecord(Dot2D dot) => CollisionRecord(dot.id, dot.id + 23, Offset(dot.id + 29, dot.id + 11));
}
