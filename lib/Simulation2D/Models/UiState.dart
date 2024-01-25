import 'dart:ui';

import 'package:equatable/equatable.dart';

class UiState extends Equatable {
  double scale = 1;
  double dotPaintRadius = 2;

  Offset scaleCenter = const Offset(0, 0);
  Offset panCenter = const Offset(0, 0);

  int maxTrailAge = 200;
  bool running = true;
  bool showConnection = true;
  Size size = const Size(500, 500);
  bool showPositionHistory = true;
  int particleFindingInterval = 10;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        scale,
        dotPaintRadius,
        scaleCenter,
        panCenter,
        maxTrailAge,
        running,
        showConnection,
        size,
        showPositionHistory,
        particleFindingInterval,
      ];
}
