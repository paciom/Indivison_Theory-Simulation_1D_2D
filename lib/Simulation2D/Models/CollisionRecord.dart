import 'dart:ui';

import 'package:equatable/equatable.dart';

class CollisionRecord extends Equatable {
  final int dotId;
  final int time;
  final Offset location;

  CollisionRecord(
    this.dotId,
    this.time,
    this.location,
  );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [dotId, time, location];
}
