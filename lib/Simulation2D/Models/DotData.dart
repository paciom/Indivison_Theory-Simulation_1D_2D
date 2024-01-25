import 'package:equatable/equatable.dart';
import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';

class DotData extends Equatable {
  double initialAreaWidth = 2;
  double initialAreaHeight = 2;
  double collisionRadius = 0.5;
  int seed = 0;
  int numberOfDots = 15;
  int time = 0;
  Map<int, Dot2D> dots = {};

  @override
  bool? get stringify => true;

  @override
  get props => [
        initialAreaWidth,
        initialAreaHeight,
        collisionRadius,
        seed,
        numberOfDots,
        time,
        dots,
      ];
}
