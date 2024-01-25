import 'Connection.dart';
import 'Dot.dart';

class ConnectionChecker {
  bool isConnected(Dot a, Dot b) {
    Connection? conn = a.connection;
    return conn != null && ((conn.dotA == a && conn.dotB == b) || (conn.dotA == b && conn.dotB == a));
  }

  Dot getOtherDot(Dot thisDot, Connection connection) {
    if (connection.dotA == thisDot) {
      return connection.dotB;
    }
    if (connection.dotB == thisDot) {
      return connection.dotA;
    }
    throw Exception("This dot does not belong to the connection");
  }

// List<List<Dot>> getCollidingPairs(List<Dot> dots) {
//   List<List<Dot>> pairs = [];
//   List<Dot> checkedDots = [];
//
//   for (var i = 0; i < dots.length - 1; i++) {
//     for (var j = i + 1; j < dots.length; j++) {
//       var a = dots[i];
//       var b = dots[j];
//       if (a.position == b.position && a.speed != b.speed) {
//         if (!checkedDots.contains(a) && !checkedDots.contains(b)) {
//           checkedDots.add(a);
//           checkedDots.add(b);
//           pairs.add([a, b]);
//         }
//       }
//     }
//   }
//
//   return pairs;
// }
}
