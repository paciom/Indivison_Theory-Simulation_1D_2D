import 'dart:math';
import 'dart:ui';

import 'package:light_simulator/Common/ColorGenerator.dart';

import '../Dot.dart';
import '../Settings.dart';
import 'DotGenerator.dart';

class RandomDotsGenerator implements DotGenerator {
  final Random _random;
  final Settings _settings;
  final ColorGenerator _colorGenerator;

  RandomDotsGenerator(this._settings, this._random, this._colorGenerator);

  List<Dot> generate() {
    return List<Dot>.generate(_settings.numberOfDots, (index) {
      int speed = _random.nextBool() ? 1 : -1;
      int position = _random.nextInt(_settings.maxInitialPosition);
      Color color = _colorGenerator.getRandomColor();
      Dot dot = Dot(speed: speed, position: position, color: color);
      return dot;
    });
  }
}
