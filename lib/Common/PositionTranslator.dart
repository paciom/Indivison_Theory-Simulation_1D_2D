import 'dart:ui';

import 'package:light_simulator/Simulation2D/Models/UiState.dart';

class PositionTranslator {
  final UiState _ui;

  PositionTranslator(this._ui);

  Offset convert(Offset position) {
    // Translate (pan) the position
    Offset panTranslatedPosition = position + _ui.panCenter;

    // Scale the position around scaleCenter
    Offset scaleRelativePosition = panTranslatedPosition - _ui.scaleCenter;
    Offset scaledPosition = Offset(
      scaleRelativePosition.dx * _ui.scale,
      scaleRelativePosition.dy * _ui.scale,
    );

    return scaledPosition + _ui.scaleCenter;
  }
}
