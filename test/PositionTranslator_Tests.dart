import 'package:flutter_test/flutter_test.dart';
import 'package:light_simulator/Common/PositionTranslator.dart';
import 'package:light_simulator/Simulation2D/Models/UiState.dart';

class PositionTranslator_Tests {
  void run() {
    var data = [
      {
        'ui': UiState()
          ..scaleCenter = Offset(0, 0)
          ..scale = 1
          ..panCenter = Offset(0, 0),
        'position': Offset(0, 0),
        'expected': Offset(0, 0)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(1, 1)
          ..scale = 1
          ..panCenter = Offset(0, 0),
        'position': Offset(0, 0),
        'expected': Offset(0, 0)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(1, 1)
          ..scale = 1
          ..panCenter = Offset(1, 1),
        'position': Offset(0, 0),
        'expected': Offset(1, 1)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(1, 1)
          ..scale = 1
          ..panCenter = Offset(1, 1),
        'position': Offset(1, 1),
        'expected': Offset(2, 2)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(0, 0)
          ..scale = 2
          ..panCenter = Offset(0, 0),
        'position': Offset(0, 0),
        'expected': Offset(0, 0)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(0, 0)
          ..scale = 2
          ..panCenter = Offset(0, 0),
        'position': Offset(1, 1),
        'expected': Offset(2, 2)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(0, 0)
          ..scale = 1
          ..panCenter = Offset(1, 1),
        'position': Offset(0, 0),
        'expected': Offset(1, 1)
      },
      {
        'ui': UiState()
          ..scaleCenter = Offset(0, 0)
          ..scale = 1
          ..panCenter = Offset(2, 2),
        'position': Offset(0, 0),
        'expected': Offset(2, 2)
      },
    ];

    data.forEach((item) {
      var ui = item['ui'] as UiState;
      var position = item['position'] as Offset;
      var expected = item['expected'] as Offset;

      test('PositionTranslator_Tests: Final position of $ui should be $expected', () {
        var translator = PositionTranslator(ui);
        var result = translator.convert(position);
        expect(result, expected);
      });
    });
  }
}
