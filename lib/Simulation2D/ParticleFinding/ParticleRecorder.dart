import 'package:light_simulator/Simulation2D/Models/AppState.dart';
import 'package:light_simulator/Simulation2D/Models/Particle.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleFinder.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/ParticleConverter.dart';

class ParticleRecorder {
  final AppState _state;
  final ParticleFinder _particleFinder;
  final ParticleConverter _particleConverter;

  ParticleRecorder(
    this._state,
    this._particleFinder,
    this._particleConverter,
  );

  void addFrozenParticles() {
    if (this._state.data.time != 0 && _state.data.time % _state.ui.particleFindingInterval == 0) {
      var particles = _particleFinder.findParticles(_state.data.dots);
      for (var particle in particles) {
        if (!_state.frozenParticles.containsKey(particle.id)) {
          var frozenParticle = _particleConverter.toParticleProto(particle);
          _state.frozenParticles[particle.id] = frozenParticle;
        }
      }

      printParticles(particles);
    }
  }

  void printParticles(List<Particle> particles) {
    var particleSizes = _state.frozenParticles.values.map((e) => e.dots.length).where((element) => element > 1).toList();
    particleSizes.sort((a, b) => b - a);
    print("${particleSizes.toString()}");
  }
}
