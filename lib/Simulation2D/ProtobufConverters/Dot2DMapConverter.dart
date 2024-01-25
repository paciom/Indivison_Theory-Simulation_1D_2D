import 'package:fixnum/fixnum.dart' as $num;
import 'package:light_simulator/Generated/Dot2D.pb.dart' as pbDot2D;
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import "package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart";

class Dot2DMapConverter {
  final Dot2DConverter _dot2dConverter;

  Dot2DMapConverter(this._dot2dConverter);

  Map<int, Dot2D> fromMapProto(Map<$num.Int64, pbDot2D.Dot2D> pbDots) {
    Map<int, Dot2D> dots = {};
    for (var id in pbDots.keys) {
      var pbDot = pbDots[id]!;
      dots[id.toInt()] = _dot2dConverter.fromProto(pbDot);
    }
    return dots;
  }

  Map<$num.Int64, pbDot2D.Dot2D> toMapProto(Map<int, Dot2D> dots) {
    Map<$num.Int64, pbDot2D.Dot2D> pbDots = {};
    for (var id in dots.keys) {
      Dot2D dot = dots[id]!;
      pbDots[$num.Int64(id)] = _dot2dConverter.toProto(dot);
    }
    return pbDots;
  }
}
