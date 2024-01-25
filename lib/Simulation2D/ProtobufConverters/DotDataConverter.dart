import 'package:fixnum/fixnum.dart' as $fixnum;
import "package:light_simulator/Generated/DotData.pb.dart" as pbDotData;
import "package:light_simulator/Simulation2D/Models/DotData.dart";
import "package:light_simulator/Simulation2D/ProtobufConverters/Dot2DMapConverter.dart";

class DotDataConverter {
  final Dot2DMapConverter _converter;

  DotDataConverter(this._converter);

  pbDotData.DotData toProto(DotData data) {
    return pbDotData.DotData(
        initialAreaHeight: data.initialAreaHeight,
        initialAreaWidth: data.initialAreaWidth,
        time: $fixnum.Int64(data.time),
        collisionRadius: data.collisionRadius,
        seed: $fixnum.Int64(data.seed),
        numberOfDots: $fixnum.Int64(data.numberOfDots),
        dots: _converter.toMapProto(data.dots));
  }

  DotData fromProto(pbDotData.DotData data) {
    return (DotData()
      ..initialAreaHeight = data.initialAreaHeight
      ..initialAreaWidth = data.initialAreaWidth
      ..time = data.time.toInt()
      ..collisionRadius = data.collisionRadius
      ..seed = data.seed.toInt()
      ..numberOfDots = data.numberOfDots.toInt()
      ..dots = _converter.fromMapProto(data.dots));
  }

// Iterable<Dot2D> getDots(pbDotData.DotData data) {
//   var dots = data.dots
//       .map((d) => )
//       .toList();
//
//   for (var i = 0; i < data.dots.length; ++i) {
//     var pbDot = data.dots[i];
//     var dot = dots[i];
//     dot.locationHistory.addAll(pbDot.locationHistory.map((e) => Offset(e.dx, e.dy)));
//     dot.collisions.addAll(mapCollisions(pbDot, dots, data));
//     dot.locationSwapHistory.addAll(pbDot.locationSwapHistory.map((e) => LocationSwapRecord(
//           Offset(e.start.dx, e.start.dy),
//           Offset(e.end.dx, e.end.dy),
//           e.time.toInt(),
//         )));
//   }
//
//   return dots;
// }
}
