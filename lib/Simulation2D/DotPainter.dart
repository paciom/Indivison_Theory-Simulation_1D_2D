import 'package:flutter/material.dart';
import 'package:light_simulator/Common/PositionTranslator.dart';
import 'package:light_simulator/Simulation2D/DotColors.dart';

import '../Common/ColorGenerator.dart';
import 'Models/AppState.dart';
import 'Models/Dot2d.dart';

class DotPainter extends CustomPainter {
  final AppState _state;
  final PositionTranslator _positionTranslator;
  final DotColors _dotColors;
  final ColorGenerator _colorGenerator;

  DotPainter(
    this._state,
    this._positionTranslator,
    this._dotColors,
    this._colorGenerator,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (var dot in _state.data.dots.values) {
      paint.color = _dotColors.getColor(dot);
      canvas.drawCircle(_positionTranslator.convert(dot.position), _state.ui.dotPaintRadius, paint);
      drawConnection(dot, canvas, paint);
      drawLocationHistory(dot, canvas, paint);
    }
  }

  void drawConnection(Dot2D dot, Canvas canvas, Paint paint) {
    var conn = dot.connectedDotId;
    if (conn != null) {
      if (dot.id < conn && _state.ui.showConnection) {
        paint.color = _colorGenerator.getRandomColor();
        canvas.drawLine(
            _positionTranslator.convert(dot.position), _positionTranslator.convert(_state.data.dots[dot.connectedDotId]!.position), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  void drawLocationHistory(Dot2D dot, Canvas canvas, Paint paint) {
    if (!_state.ui.showPositionHistory) {
      return;
    }
    var history = dot.locationSwapHistory;
    paint.color = _dotColors.getColor(dot);
    for (var i = 0; i < history.length - 1; ++i) {
      var record = history[i];
      var recordNext = history[i + 1];
      if (_state.data.time - record.time < _state.ui.maxTrailAge) {
        canvas.drawLine(_positionTranslator.convert(record.end), _positionTranslator.convert(recordNext.start), paint);
      }
    }

    if (history.isNotEmpty) {
      var start = history[history.length - 1];

      if (_state.data.time - start.time < _state.ui.maxTrailAge) {
        canvas.drawLine(_positionTranslator.convert(start.end), _positionTranslator.convert(dot.position), paint);
      }
    }
  }
}
