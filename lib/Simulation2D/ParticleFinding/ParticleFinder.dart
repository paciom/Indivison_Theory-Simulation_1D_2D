import 'package:light_simulator/Simulation2D/Models/Dot2d.dart';
import 'package:light_simulator/Simulation2D/Models/Particle.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/CollisionDotsFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleGrouper.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticlePatternChecker.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/PatternFinder.dart';

class ParticleFinder {
  final PatternFinder _patternFinder;
  final CollisionDotsFinder _collisionDotsFinder;
  final ParticleGrouper _particleGrouper;
  final ParticlePatternChecker _particlePatternChecker;

  ParticleFinder(
    this._patternFinder,
    this._collisionDotsFinder,
    this._particleGrouper,
    this._particlePatternChecker,
  );

  List<Particle> findParticles(Map<int, Dot2D> dots) {
    Map<String, Particle> particleMap = {};
    Map<int, List<int>> dotCollisionPatterns = {};

    for (var dot in dots.values) {
      List<int> patternDotIds = [];

      var collisions = dot.collisions;
      var patterns = _patternFinder.findPattern(collisions);
      dotCollisionPatterns[dot.id] = patterns;
      if (patterns.isNotEmpty) {
        var longestPattern = patterns.last;
        var patternCollisions = collisions.sublist(collisions.length - 1 - longestPattern, collisions.length - 1);
        var patternStartTime = patternCollisions.first.time;
        patternDotIds.addAll(patternCollisions.map((collision) => collision.dotId));
        List<int> searchedDots = [dot.id];
        List<int> dotsInParticle = [...patternDotIds];
        for (var dot in dotsInParticle) {
          var collidedDots = _collisionDotsFinder.findCollidedDots(dot, searchedDots, patternStartTime);
          dotsInParticle.addAll(collidedDots.map((d) => d.id));
        }

        var particle = Particle()
          ..dots.add(dot.id)
          ..dots.addAll(dotsInParticle.map((d) => d))
          ..dots.sort((a, b) => a - b);
        var particleId = particle.dots.toSet().toList().map((e) => e.toString()).join(",");

        if (!particleMap.containsKey(particleId)) {
          particleMap[particleId] = particle;
        }
      }
    }

    var particles = _particleGrouper.groupParticles(particleMap.values.toList());

    var validParticles = particles
        .where((particle) => _particlePatternChecker.isPatternsValid(particle.dots.map((dot) => dot).toList(), dotCollisionPatterns))
        .toList();

    return validParticles;
  }
}
