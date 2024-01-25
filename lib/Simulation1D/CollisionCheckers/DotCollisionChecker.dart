import 'package:light_simulator/Simulation1D/Dot.dart';

abstract class DotCollisionChecker {
  bool isCollided(Dot a, Dot b);
}
