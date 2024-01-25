import 'package:light_simulator/Common/ColorGenerator.dart';

import '../Dot.dart';
import 'DotGenerator.dart';

class QuatonGenerator implements DotGenerator {
  final ColorGenerator _colorGenerator;

  QuatonGenerator(this._colorGenerator);

  List<Dot> generate() {
    return [
      Dot(name: "b", speed: 1, position: 5, color: _colorGenerator.getRandomColor()),
      Dot(name: "a", speed: 1, position: 25, color: _colorGenerator.getRandomColor()),
      Dot(name: "C", speed: -1, position: 31, color: _colorGenerator.getRandomColor()),
      Dot(name: "D", speed: -1, position: 37, color: _colorGenerator.getRandomColor())
    ];
  }
}
