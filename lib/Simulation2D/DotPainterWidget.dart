import 'package:flutter/material.dart';
import 'package:light_simulator/UI/UiFactory.dart';

import 'DotPainterWidgetState.dart';

class DotPainterWidget extends StatefulWidget {
  final Size _size;

  DotPainterWidget(this._size, {super.key}) {}

  @override
  DotPainterWidgetState createState() {
    return DotPainterWidgetState(
      _size,
      UiFactory(),
    );
  }
}
