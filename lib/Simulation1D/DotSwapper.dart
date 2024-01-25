import 'Connection.dart';
import 'Dot.dart';

class DotSwapper {
  void swapDotWithConnectedDot(Dot dot) {
    var conn = dot.connection;
    if (conn == null) {
      return;
    }
    swapLocations(conn);
  }

  void swapLocations(Connection connection) {
    Dot dotA = connection.dotA;
    Dot dotB = connection.dotB;

    int tempPosition = dotA.position;
    dotA.position = dotB.position;
    dotB.position = tempPosition;
  }
}
