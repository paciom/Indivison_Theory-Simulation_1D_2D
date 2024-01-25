import 'dart:math';

import 'package:flutter/material.dart';

import 'Connection.dart';
import 'Dot.dart';
import 'Settings.dart';

class MovingDotPainter extends CustomPainter {
  final List<Dot> dots;
  final Settings _settings;

  MovingDotPainter(this.dots, this._settings);

  @override
  void paint(Canvas canvas, Size size) {
    double centerOfMass = getCenterOfMass();
    if (_settings.showEntanglement) {
      showEntanglement(canvas, size, centerOfMass);
    }
    for (Dot dot in dots) {
      Paint paint = getPaint(dot);

      drawLeadDots(size, dot, centerOfMass, canvas, paint);

      if (_settings.showHistory) {
        drawHistoryDots(dot, size, centerOfMass, canvas, paint);
      }
    }
  }

  void showEntanglement(Canvas canvas, Size size, double centerOfMass) {
    List<Connection> connections = getConnections();
    for (var connection in connections) {
      var aX = getLeadDotX(size, connection.dotA, centerOfMass);
      var bX = getLeadDotX(size, connection.dotB, centerOfMass);
      var centerX = (aX + bX) / 2;

      drawHalfCircle(canvas, size, centerX, aX, connection.dotA.color);
    }
  }

  void drawHalfCircle(Canvas canvas, Size size, final Offset center, final Offset startPoint, final Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1 * _settings.scale
      ..style = PaintingStyle.stroke;

    // Compute the radius based on the distance between the center and the starting point.
    final radius = (center - startPoint).distance;

    // Determine the bounding rectangle for the circle based on the center and the radius.
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Draw the top half-circle.
    canvas.drawArc(rect, 0.0, pi, false, paint);
  }

  Paint getPaint(Dot dot) {
    var paint = Paint()
      ..color = dot.connection != null ? dot.connection!.dotA.color : dot.color
      ..style = PaintingStyle.fill;
    return paint;
  }

  double getCenterOfMass() {
    double centerOfMass = dots.fold(0, (sum, dot) => sum + dot.position) / dots.length;
    return centerOfMass;
  }

  void drawHistoryDots(Dot dot, Size size, double centerOfMass, Canvas canvas, Paint paint) {
    int i = 0;
    for (int position in dot.history.toList().reversed) {
      double historyX = getDrawingX(size, position, centerOfMass);
      if (historyX >= 0 && historyX <= size.width) {
        var historyY = (i + 1) * _settings.scale + _settings.dragOffset.dy;
        if (historyY >= 0 && historyY <= size.height) {
          canvas.drawCircle(Offset(historyX, historyY), _settings.dotPaintRadius * _settings.scale, paint);
        }
      }

      i++;
    }
  }

  void drawLeadDots(Size size, Dot dot, double centerOfMass, Canvas canvas, Paint paint) {
    Offset dotX = getLeadDotX(size, dot, centerOfMass);
    canvas.drawCircle(dotX, _settings.dotPaintRadius * _settings.scale * 3, paint);
  }

  Offset getLeadDotX(Size size, Dot dot, double centerOfMass) {
    var dx = getDrawingX(size, dot.position, centerOfMass);
    var dotX = Offset(dx, _settings.dragOffset.dy);
    return dotX;
  }

  double getDrawingX(Size size, int position, double centerOfMass) {
    var historyX = (size.width / 2 + (position - centerOfMass).toDouble()) * _settings.scale + _settings.dragOffset.dx;
    return historyX;
  }

  @override
  bool shouldRepaint(covariant MovingDotPainter oldDelegate) {
    return true;
  }

  List<Connection> getConnections() {
    List<Connection> connections = [];
    for (var dot in dots) {
      var connection = dot.connection;
      if (connection != null && !connections.contains(connection)) {
        connections.add(connection);
      }
    }

    return connections;
  }
}
