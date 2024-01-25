import 'package:equatable/equatable.dart';

abstract class ParticleRO {
  List<int> get dots;

  String get id;
}

class Particle extends Equatable implements ParticleRO {
  @override
  List<int> dots = [];

  @override
  String id = "";

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        dots,
      ];
}
