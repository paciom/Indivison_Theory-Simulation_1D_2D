import 'dart:ui';

class Settings {
  int maxInitialPosition = 500;
  int maxHistory = 2000;
  double dotPaintRadius = 0.5;

  double collisionPercentage = 0.9;

  int numberOfDots = 100;
  bool showHistory = true;
  bool showEntanglement = true;

  int seed = 3;
  double scale = 1;
  Offset dragOffset = const Offset(0, 10);
  bool running = true;
  int time = 0;
}
