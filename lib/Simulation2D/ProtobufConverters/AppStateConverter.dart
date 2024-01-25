import "dart:ui";

import 'package:fixnum/fixnum.dart' as $fixnum;
import "package:light_simulator/Generated/AppState.pb.dart" as pbAppState;
import "package:light_simulator/Generated/ProtoOffset.pb.dart" as pbProtoOffset;
import "package:light_simulator/Generated/ProtoSize.pb.dart" as pbProtoSize;
import "package:light_simulator/Generated/UiState.pb.dart" as pbUiState;
import "package:light_simulator/Simulation2D/Models/AppState.dart";
import "package:light_simulator/Simulation2D/Models/UiState.dart";
import "package:light_simulator/Simulation2D/ProtobufConverters/DotDataConverter.dart";

class AppStateConverter {
  final DotDataConverter _dotDataConverter;

  AppStateConverter(this._dotDataConverter);

  pbAppState.AppState toProto(AppState appState) {
    var data = appState.data;
    var ui = appState.ui;
    var toAppState = pbAppState.AppState();

    toAppState.data = _dotDataConverter.toProto(data);
    var toParticles = appState.frozenParticles;
    for (var id in appState.frozenParticles.keys) {
      toAppState.particles[id] = toParticles[id]!;
    }

    toAppState.ui = (pbUiState.UiState(
      scale: ui.scale,
      dotPaintRadius: ui.dotPaintRadius,
      scaleCenter: pbProtoOffset.ProtoOffset(
        dx: ui.scaleCenter.dx,
        dy: ui.scaleCenter.dy,
      ),
      panCenter: pbProtoOffset.ProtoOffset(
        dx: ui.panCenter.dx,
        dy: ui.panCenter.dy,
      ),
      maxTrailAge: $fixnum.Int64(ui.maxTrailAge),
      running: ui.running,
      showConnection: ui.showConnection,
      size: pbProtoSize.ProtoSize(
        width: ui.size.width,
        height: ui.size.height,
      ),
      showPositionHistory: ui.showPositionHistory,
    ));

    return toAppState;
  }

  AppState fromProto(pbAppState.AppState appState) {
    var data = appState.data;
    var ui = appState.ui;
    var toAppState = AppState()
      ..data = _dotDataConverter.fromProto(data)
      ..ui = (UiState()
        ..scale = ui.scale
        ..dotPaintRadius = ui.dotPaintRadius
        ..scaleCenter = Offset(
          ui.scaleCenter.dx,
          ui.scaleCenter.dy,
        )
        ..panCenter = Offset(
          ui.panCenter.dx,
          ui.panCenter.dy,
        )
        ..maxTrailAge = ui.maxTrailAge.toInt()
        ..running = ui.running
        ..showConnection = ui.showConnection
        ..size = Size(
          ui.size.width,
          ui.size.height,
        )
        ..showPositionHistory = ui.showPositionHistory);

    return toAppState;
  }
}
