import 'dart:math' show acos, pi;
import 'dart:ui' show Offset;

import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart';

import 'Models/CollisionRecord.dart';
import 'Models/Dot2d.dart';

class Collision {
  Dot2D a;
  Dot2D b;
  num distance;

  Collision(this.a, this.b, this.distance);
}

class CollisionChecker {
  final AppState _state;
  Map<int, Dot2D> uniqueDots = {};

  CollisionChecker(this._state);

  List<Collision> getCollidedDotPairs(Map<int, Dot2D> dots) {
    Map<int, List<Collision>> collidedPairs = {};
    var collisionDistance = _state.data.collisionRadius * 2;
    for (var i = 0; i < dots.keys.length; i++) {
      for (var j = i + 1; j < dots.keys.length; j++) {
        var idA = dots.keys.elementAt(i);
        var idB = dots.keys.elementAt(j);

        Dot2D a = dots[idA]!;
        Dot2D b = dots[idB]!;
        var pA = a.position;
        var pB = b.position;
        if ((pA.dx - pB.dx).abs() > collisionDistance || (pA.dy - pB.dy).abs() > collisionDistance) {
          continue;
        }
        var distance = (a.position - b.position).distance;
        if (distance < _state.data.collisionRadius && !areSameDirection(a.direction, b.direction)) {
          if (a.id.compareTo(b.id) < 0) {
            addPair(collidedPairs, a, b, distance);
          } else {
            addPair(collidedPairs, b, a, distance);
          }
        }
      }
    }
    List<Collision> collisions = _getClosestCollisions(collidedPairs);
    return collisions;
  }

  List<Collision> _getClosestCollisions(Map<int, List<Collision>> collidedPairs) {
    List<Collision> collisions = [];
    uniqueDots = {};

    for (var pairs in collidedPairs.values) {
      pairs.sort((a, b) => a.distance < b.distance ? -1 : 1);
      for (var pair in pairs) {
        if (!uniqueDots.containsKey(pair.a.id) && !uniqueDots.containsKey(pair.b.id)) {
          addCollisionHistory(pair.a, pair.b);
          addCollisionHistory(pair.b, pair.a);
          collisions.add(pair);
          uniqueDots[pair.a.id] = (pair.a);
          uniqueDots[pair.b.id] = (pair.b);
        }
      }
    }
    return collisions;
  }

  void addCollisionHistory(Dot2D a, Dot2D b) {
    a.collisions.add(CollisionRecord(b.id, _state.data.time, a.position));
  }

  void addPair(Map<int, List<Collision>> collidedPairs, Dot2D a, Dot2D b, num distance) {
    if (!collidedPairs.containsKey(a.id)) {
      collidedPairs[a.id] = [];
    }
    Dot2D aConnected = swapConnected(a) ?? a;
    Dot2D bConnected = swapConnected(b) ?? b;
    if (!areSameDirection(aConnected.direction, bConnected.direction)) {
      collidedPairs[a.id]!.add(Collision(aConnected, bConnected, distance));
    }
  }

  bool areSameDirection(Offset offset1, Offset offset2) {
    double dotProduct = offset1.dx * offset2.dx + offset1.dy * offset2.dy;
    double angleInRadians = acos(dotProduct);
    double angleInDegrees = angleInRadians * 180 / pi;

    return angleInDegrees.abs() <= 0.01;
  }

  Dot2D? swapConnected(Dot2D a) {
    var conn = a.connectedDotId;
    if (conn == null) {
      return a;
    } else {
      var other = getConnected(a)!;
      swapPosition(other, a);
      disconnect(other);
      disconnect(a);
      return other;
    }
  }

  void swapPosition(Dot2D other, Dot2D a) {
    var temp = other.position;
    other.position = a.position;
    a.position = temp;
    recordPositionSwap(a, other);
    recordPositionSwap(other, a);
  }

  Dot2D? getConnected(Dot2D d) {
    var connectedDotId = d.connectedDotId;
    if (connectedDotId == null) {
      return null;
    } else {
      return _state.data.dots[connectedDotId];
    }
  }

  Dot2D getDot(int id) {
    var dot = _state.data.dots[id];

    if (dot == null) {
      throw "Dot id $id not found";
    }
    return dot;
  }

  void disconnect(Dot2D d) {
    var connectedDotId = d.connectedDotId;
    if (connectedDotId != null) {
      var connectedDot = _state.data.dots[connectedDotId]!;
      connectedDot.connectedDotId = null;
      d.connectedDotId = null;
    }
  }

  void recordPositionSwap(Dot2D a, Dot2D other) {
    a.locationSwapHistory.add(LocationSwapRecord(a.position, other.position, _state.data.time));
  }
}
