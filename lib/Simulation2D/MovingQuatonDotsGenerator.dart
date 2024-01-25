import 'dart:math';
import 'dart:ui';

import 'package:light_simulator/Simulation2D/DotsGenerator.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

class MovingQuatonDotsGenerator implements DotsGenerator {
  @override
  Map<int, Dot2D> create(Size size) {
    final squareRootOf2 = sqrt(2);
    Map<int, Dot2D> dots = {
      0: Dot2D(2, Offset(800, (squareRootOf2 * 5)), const Offset(1, 1)),
      1: Dot2D(1, Offset(800, squareRootOf2 * 25), const Offset(1, 1)),
      2: Dot2D(3, Offset(800, squareRootOf2 * 31), const Offset(1, -1)),
      3: Dot2D(4, Offset(800, squareRootOf2 * 37), const Offset(1, -1)),
    };

    return dots;
  }
}
