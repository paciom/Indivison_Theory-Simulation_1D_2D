import 'package:light_simulator/Simulation2D/Models/Particle.dart';

class ParticleFreezer {
  ParticleRO freeze(ParticleRO particle) {
    var result = Particle();
    result.dots = particle.dots.map((id) => id).toList();
    result.id = particle.id;
    return result;
  }
}
