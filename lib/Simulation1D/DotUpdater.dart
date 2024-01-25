import 'CollisionCheckers/CollisionChecker.dart';
import 'Dot.dart';
import 'DotConnector.dart';
import 'DotSwapper.dart';
import 'Settings.dart';

class DotUpdater {
  final CollisionChecker _collisionChecker;
  final DotSwapper _dotSwapper;
  final DotConnector _connector;
  final Settings _settings;

  DotUpdater(this._collisionChecker, this._dotSwapper, this._connector, this._settings);

  void update(List<Dot> dots) {
    if (_settings.running) {
      _settings.time++;
      for (Dot dot in dots) {
        dot.position += dot.speed;
        if (dot.history.length >= _settings.maxHistory) {
          dot.history.removeFirst();
        }
        dot.history.addLast(dot.position);
      }

      var collidedDots = _collisionChecker.getCollidingPairs(dots);
      for (var pair in collidedDots) {
        var a = pair[0];
        var b = pair[1];
        _dotSwapper.swapDotWithConnectedDot(a);
        _dotSwapper.swapDotWithConnectedDot(b);

        _connector.disconnectDot(a);
        _connector.disconnectDot(b);
      }
      var newCollidedDots = _collisionChecker.getCollidingPairs(dots);
      for (var pair in newCollidedDots) {
        var a = pair[0];
        var b = pair[1];
        _connector.connect(a, b);
      }
    }
  }
}
