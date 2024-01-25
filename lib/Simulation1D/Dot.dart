import 'dart:collection';
import 'dart:ui';

import 'Connection.dart';

class Dot {
  String? name;
  int speed;
  Connection? connection;
  int position;
  Color color;
  Queue<int> history = Queue<int>();

  Dot({required this.speed, this.connection, required this.position, required this.color, this.name});
}
