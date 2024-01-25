import 'package:equatable/equatable.dart';
import 'package:light_simulator/Generated/Particle2D.pb.dart';

import 'DotData.dart';
import 'UiState.dart';

class AppState extends Equatable {
  DotData data = DotData();

  UiState ui = UiState();

  Map<String, Particle2D> frozenParticles = {};

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [data, ui];
}
