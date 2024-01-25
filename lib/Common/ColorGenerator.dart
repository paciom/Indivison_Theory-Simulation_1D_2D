import 'dart:math';
import 'dart:ui';

class ColorGenerator {
  final Random _random;

  ColorGenerator(this._random);

  Color getRandomColor() => Color.fromARGB(255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
}
