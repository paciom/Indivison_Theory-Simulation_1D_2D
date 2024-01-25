import 'dart:ui';

import 'package:light_simulator/Common/ColorGenerator.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

import 'Models/AppState.dart';

class DotColors {
  final AppState _state;
  final ColorGenerator _colorGenerator;
  final List<Color> _colors = [];

  DotColors(this._state, this._colorGenerator) {
    for (var i = 0; i < _state.data.numberOfDots; ++i) {
      _colors.add(_colorGenerator.getRandomColor());
    }
  }

  Color getColor(Dot2D dot) {
    if (_colors.isEmpty) {}
    return _colors[dot.id];
  }
}
