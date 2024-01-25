import "package:light_simulator/Generated/Particle2D.pb.dart" as pbParticle2D;
import "package:light_simulator/Simulation2D/Models/AppState.dart";
import "package:light_simulator/Simulation2D/Models/Particle.dart";
import "package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart";

import "../Models/Dot2d.dart";

class ParticleConverter {
  final Dot2DConverter _converter;
  final AppState _state;

  ParticleConverter(
    this._converter,
    this._state,
  );

  Map<String, pbParticle2D.Particle2D> toParticleMapProto(Map<String, ParticleRO> frozenParticles) {
    Map<String, pbParticle2D.Particle2D> pbParticles = {};
    for (var id in frozenParticles.keys) {
      pbParticle2D.Particle2D particle = toParticleProto(frozenParticles[id]!);
      pbParticles[id] = (particle);
    }
    return pbParticles;
  }

  pbParticle2D.Particle2D toParticleProto(ParticleRO particleRO) {
    var dots = _state.data.dots;
    var particle = pbParticle2D.Particle2D()..dots.addAll(particleRO.dots.map((dot) => _converter.toProto(dots[dot]!)));

    return particle;
  }

  Map<String, Particle> fromParticleMapProto(Map<String, pbParticle2D.Particle2D> frozenParticles) {
    Map<String, Particle> results = {};
    Map<int, Dot2D> dots = {};
    for (var id in frozenParticles.keys) {
      var pbParticle = frozenParticles[id]!;
      var particle = fromParticleProto(pbParticle, dots)..id = id;

      results[id] = particle;
    }

    return results;
  }

  List<Particle> fromParticleListProto(List<pbParticle2D.Particle2D> frozenParticles) {
    List<Particle> pbParticles = [];
    Map<int, Dot2D> dots = {};
    for (var particleRO in frozenParticles) {
      Particle particle = fromParticleProto(particleRO, dots);

      pbParticles.add(particle);
    }
    return pbParticles;
  }

  Particle fromParticleProto(pbParticle2D.Particle2D particleRO, Map<int, Dot2D> dots) {
    var particle = Particle();
    for (var pbDot in particleRO.dots) {
      var id = pbDot.id.toInt();
      // Dot2D dot;
      // if (dots.containsKey(id)) {
      //   dot = dots[id]!;
      // } else {
      //   dot = Dot2D(
      //     pbDot.id.toInt(),
      //     Offset(pbDot.position.dx, pbDot.position.dy),
      //     Offset(pbDot.direction.dx, pbDot.direction.dy),
      //   );
      //   dots[id] = dot;
      // }
      particle.dots.add(id);
    }
    return particle;
  }
}
