import 'package:light_simulator/Simulation2D/Models/Particle.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleNamer.dart';

class ParticleGrouper {
  final ParticleNamer _namer;

  ParticleGrouper(this._namer);

  List<Particle> groupParticles(List<Particle> partialGroups) {
    List<Particle> result = [];

    for (var group in partialGroups) {
      var newParticle = Particle()..dots.addAll(group.dots); // Clone to avoid altering the original list
      List<Particle> toMerge = [];

      for (var existingGroup in result) {
        if (newParticle.dots.any((item) => existingGroup.dots.any((dot) => dot == item))) {
          toMerge.add(existingGroup);
        }
      }

      for (var mergeGroup in toMerge) {
        newParticle.dots.addAll(mergeGroup.dots);
        result.remove(mergeGroup);
      }

      // Remove duplicates and sort
      newParticle.dots = removeDuplicated(newParticle.dots);
      newParticle.dots.sort((a, b) => a - b);
      newParticle.id = _namer.getId(newParticle);
      result.add(newParticle);
    }

    return result;
  }

  List<int> removeDuplicated(List<int> dots) {
    Set<int> ids = {};

    List<int> distinctDots = [];

    for (var dotId in dots) {
      if (!ids.contains(dotId)) {
        ids.add(dotId);
        distinctDots.add(dotId);
      }
    }
    return distinctDots;
  }
}
