import 'package:light_simulator/Simulation2D/Models/Particle.dart';

class ParticleNamer {
  String getId(Particle particle) {
    return particle.dots.toSet().toList().map((e) => e.toString()).join(",");
  }
}
