import 'dart:ui';

import 'Models/Dot2d.dart';

abstract class DotsGenerator {
  Map<int, Dot2D> create(Size size);
}
