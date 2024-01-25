import 'dart:math';

import 'package:flutter/material.dart';
import 'package:light_simulator/Simulation2D/DotsGenerator.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

import 'Models/AppState.dart';

class RandomDotsGenerator implements DotsGenerator {
  final AppState _state;
  final Random _random;

  RandomDotsGenerator(this._state, this._random);

  @override
  Map<int, Dot2D> create(Size size) {
    Map<int, Dot2D> dots = {};
    var middleX = size.width / 2;
    var middleY = size.height / 2;
    for (int i = 0; i < _state.data.numberOfDots; i++) {
      dots[i] = Dot2D(
        i,
        Offset(
          middleX + (_random.nextDouble() - 0.5) * _state.data.initialAreaWidth,
          middleY + (_random.nextDouble() - 0.5) * _state.data.initialAreaHeight,
        ),
        Offset(_random.nextDouble() * 2 - 1, _random.nextDouble() * 2 - 1),
      );
    }
    return dots;
  }
}
