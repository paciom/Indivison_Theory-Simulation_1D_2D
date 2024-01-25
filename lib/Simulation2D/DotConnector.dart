import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

class DotConnector {
  final AppState _state;

  DotConnector(this._state);

  void connect(Dot2D a, Dot2D b) {
    if (areConnected(a, b)) {
      return;
    }

    int aConnected = disconnect(a) ?? a.id;
    int bConnected = disconnect(b) ?? b.id;

    var dots = _state.data.dots;
    _connect(dots[aConnected]!, dots[bConnected]!);
  }

  void _connect(Dot2D a, Dot2D b) {
    a.connectedDotId = b.id;
    b.connectedDotId = a.id;
  }

  bool areConnected(Dot2D a, Dot2D b) {
    return a.connectedDotId != null && a.connectedDotId == b.connectedDotId;
  }

  int? disconnect(Dot2D d) {
    var connectedId = d.connectedDotId;
    if (connectedId != null) {
      var connectedDot = _state.data.dots[connectedId]!;
      connectedDot.connectedDotId = null;
      d.connectedDotId = null;

      //swapLocations(conn);
      return connectedId;
    } else {
      return null;
    }
  }

// void swapLocations(Connection conn) {
//   var tempLocation = conn.a.position;
//   conn.a.position = conn.b.position;
//   conn.b.position = tempLocation;
// }
}
