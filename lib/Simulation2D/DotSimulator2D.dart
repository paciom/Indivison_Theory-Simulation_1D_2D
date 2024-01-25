//void main() => runApp(Dot2DApp());
import 'package:light_simulator/Common/ColorGenerator.dart';
import 'package:light_simulator/Common/PositionTranslator.dart';
import 'package:light_simulator/Simulation2D/DotColors.dart';
import 'package:light_simulator/Simulation2D/Models/AppState.dart';

import 'CollisionChecker.dart';
import 'DotConnector.dart';
import 'DotPainter.dart';
import 'DotsGenerator.dart';

class DotSimulator2D {
  late final AppState _state;
  late final DotsGenerator _dotGenerator;
  late final CollisionChecker _collisionChecker;
  late final DotConnector _dotConnector;
  final ColorGenerator _colorGenerator;
  late final DotColors _dotColors;
  late final PositionTranslator _positionTranslator;

  DotSimulator2D(
    this._state,
    this._dotGenerator,
    this._colorGenerator,
  ) {
    _collisionChecker = CollisionChecker(_state);
    _dotConnector = DotConnector(_state);
    _dotColors = DotColors(_state, _colorGenerator);
    _positionTranslator = PositionTranslator(_state.ui);
    _initializeDots();
  }

  DotPainter get painter => DotPainter(
        _state,
        _positionTranslator,
        _dotColors,
        _colorGenerator,
      );

  void update() {
    if (_state.ui.running) {
      _state.data.time++;

      _moveDots();
      _handleCollisions();
    }
  }

  void _initializeDots() {
    // Extracted the initialization logic to this method
    var dots = _dotGenerator.create(_state.ui.size);
    _state.data.dots = dots;
    dots;
  }

  void _moveDots() {
    for (var dot in _state.data.dots.values) {
      dot.position += dot.direction;
    }
  }

  void _handleCollisions() {
    var collidedDots = _collisionChecker.getCollidedDotPairs(_state.data.dots);
    for (var pair in collidedDots) {
      _dotConnector.connect(pair.a, pair.b);
    }
  }
}
