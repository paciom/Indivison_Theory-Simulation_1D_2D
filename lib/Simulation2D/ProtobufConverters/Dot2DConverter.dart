import "dart:ui";

import 'package:fixnum/fixnum.dart' as $num;
import "package:light_simulator/Generated/CollisionRecord.pb.dart" as pbCollisionRecord;
import 'package:light_simulator/Generated/Dot2D.pb.dart' as pbDot2D;
import "package:light_simulator/Generated/DotData.pb.dart" as pbDotData;
import "package:light_simulator/Generated/LocationSwapRecord.pb.dart" as pbLocationSwapRecord;
import "package:light_simulator/Generated/ProtoOffset.pb.dart" as pbProtoOffset;
import "package:light_simulator/Generated/google/protobuf/wrappers.pb.dart";
import "package:light_simulator/Simulation2D/Models/CollisionRecord.dart";
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import "package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart";

class Dot2DConverter {
  Dot2D fromProto(pbDot2D.Dot2D d) {
    var dot = Dot2D(
      d.id.toInt(),
      Offset(d.position.dx, d.position.dy),
      Offset(d.direction.dx.toDouble(), d.direction.dy.toDouble()),
    );
    if (d.connectedDotId.hasValue()) {
      dot.connectedDotId = d.connectedDotId.value.toInt();
    }
    dot.collisions.addAll(d.collisions.map((c) => CollisionRecord(c.dotId.toInt(), c.time.toInt(), Offset(c.location.dx, c.location.dy))));
    dot.locationSwapHistory.addAll(d.locationSwapHistory.map((r) => LocationSwapRecord(
          Offset(r.start.dx, r.start.dy),
          Offset(r.end.dx, r.end.dy),
          r.time.toInt(),
        )));
    dot.locationHistory.addAll(d.locationHistory.map((l) => Offset(l.dx, l.dy)));
    return dot;
  }

  pbDot2D.Dot2D toProto(Dot2D dot) {
    var pbDot = pbDot2D.Dot2D(
      position: pbProtoOffset.ProtoOffset(
        dx: dot.position.dx,
        dy: dot.position.dy,
      ),
      direction: pbProtoOffset.ProtoOffset(
        dx: dot.direction.dx,
        dy: dot.direction.dy,
      ),
      id: $num.Int64(dot.id),
      collisions: dot.collisions.map((c) => pbCollisionRecord.CollisionRecord(
          dotId: $num.Int64(c.dotId),
          time: $num.Int64(c.time),
          location: pbProtoOffset.ProtoOffset(
            dx: c.location.dx,
            dy: c.location.dy,
          ))),
      locationHistory: dot.locationHistory.map((l) => pbProtoOffset.ProtoOffset(
            dx: l.dx,
            dy: l.dy,
          )),
      locationSwapHistory: dot.locationSwapHistory.map((lsr) => pbLocationSwapRecord.LocationSwapRecord(
            start: pbProtoOffset.ProtoOffset(
              dx: lsr.start.dx,
              dy: lsr.start.dy,
            ),
            end: pbProtoOffset.ProtoOffset(
              dx: lsr.end.dx,
              dy: lsr.end.dy,
            ),
            time: $num.Int64(lsr.time),
          )),
    );
    if (dot.connectedDotId != null) {
      pbDot.connectedDotId = Int64Value(value: $num.Int64(dot.connectedDotId!));
    }
    return pbDot;
  }

  Iterable<CollisionRecord> mapCollisions(pbDot2D.Dot2D pbDot, List<Dot2D> dots, pbDotData.DotData data) {
    var collisions = pbDot.collisions.map((collision) => mapCollisionRecord(data, dots, collision));
    return collisions;
  }

  CollisionRecord mapCollisionRecord(pbDotData.DotData data, List<Dot2D> dots, pbCollisionRecord.CollisionRecord pbCollision) {
    var dot = dots.singleWhere((dt) => dt.id == pbCollision.dotId.toInt());

    var position = pbCollision.location;
    var collision = CollisionRecord(dot.id, pbCollision.time.toInt(), Offset(position.dx, position.dy));
    return collision;
  }
}
