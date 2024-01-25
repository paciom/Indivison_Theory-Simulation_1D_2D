import 'dart:ui';

import 'package:equatable/equatable.dart';

class LocationSwapRecord extends Equatable {
  final Offset start;
  final Offset end;
  final int time;

  LocationSwapRecord(this.start, this.end, this.time);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        start,
        end,
        time,
      ];
}
