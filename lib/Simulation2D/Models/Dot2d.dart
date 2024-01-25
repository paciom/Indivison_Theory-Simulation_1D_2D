import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:light_simulator/Simulation2D/Models/LocationSwapRecord.dart';

import 'CollisionRecord.dart';

class Dot2D extends Equatable {
  int id;
  Offset position;
  Offset direction;
  int? connectedDotId;

  final List<CollisionRecord> collisions = [];
  final List<Offset> locationHistory = [];
  final List<LocationSwapRecord> locationSwapHistory = [];

  Dot2D(this.id, this.position, this.direction) {
    direction = Offset.fromDirection(direction.direction);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        position,
        direction,
        connectedDotId,
        collisions,
        locationHistory,
        locationSwapHistory,
      ];
}
