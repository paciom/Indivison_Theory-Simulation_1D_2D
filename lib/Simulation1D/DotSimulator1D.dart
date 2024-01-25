import 'dart:math';

import 'package:light_simulator/Common/ColorGenerator.dart';
import 'package:light_simulator/Simulation1D/CollisionCheckers/CollisionChecker.dart';
import 'package:light_simulator/Simulation1D/CollisionCheckers/OddEvenCollisionChecker.dart';
import 'package:light_simulator/Simulation1D/Dot.dart';
import 'package:light_simulator/Simulation1D/DotConnector.dart';
import 'package:light_simulator/Simulation1D/DotGenerators/DotGenerator.dart';
import 'package:light_simulator/Simulation1D/DotGenerators/RandomDotsGenerator.dart';
import 'package:light_simulator/Simulation1D/DotSwapper.dart';
import 'package:light_simulator/Simulation1D/DotUpdater.dart';
import 'package:light_simulator/Simulation1D/MovingDotPainter.dart';
import 'package:light_simulator/Simulation1D/Settings.dart';

class DotSimulator1D {
  late List<Dot> _dots;
  late Settings _settings;
  late DotUpdater _updater;
  late DotGenerator _dotGenerator;

  DotSimulator1D(Settings settings) {
    _settings = settings;
    var random = Random(_settings.seed);
    var colorGenerator = ColorGenerator(random);
    _dotGenerator = RandomDotsGenerator(_settings, random, colorGenerator);
    _updater = DotUpdater(CollisionChecker(OddEvenCollisionChecker()), DotSwapper(), DotConnector(), _settings);
    _dots = _dotGenerator.generate();
  }

  MovingDotPainter get painter => MovingDotPainter(_dots, _settings);

  Settings get settings => _settings;

  void update() {
    _updater.update(_dots);
  }
}
