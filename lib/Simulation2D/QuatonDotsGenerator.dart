import 'dart:ui';

import 'package:light_simulator/Simulation2D/DotsGenerator.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

class QuatonDotsGenerator implements DotsGenerator {
  QuatonDotsGenerator();

  @override
  Map<int, Dot2D> create(Size size) {
    Map<int, Dot2D> dots = {
      0: Dot2D(2, const Offset(100, 5), const Offset(0, 1)),
      1: Dot2D(1, const Offset(100, 25), const Offset(0, 1)),
      2: Dot2D(3, const Offset(100, 31), const Offset(0, -1)),
      3: Dot2D(4, const Offset(100, 37), const Offset(0, -1)),
    };

    return dots;
  }
}
