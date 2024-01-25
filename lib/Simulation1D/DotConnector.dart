import 'package:light_simulator/Simulation1D/Connection.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';

class DotConnector {
  void disconnect(Connection connection) {
    connection.dotA.connection = null;
    connection.dotB.connection = null;
  }

  void disconnectDot(Dot dot) {
    var connection = dot.connection;
    if (connection != null) {
      disconnect(connection);
    }
  }

  void connect(Dot a, Dot b) {
    if (a.speed != b.speed) {
      if (a.connection != null) {
        disconnect(a.connection!);
      }
      if (b.connection != null) {
        disconnect(b.connection!);
      }
      Connection connection = Connection(dotA: a, dotB: b);
      a.connection = connection;
      b.connection = connection;
    }
  }
}
