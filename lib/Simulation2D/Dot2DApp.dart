import 'package:flutter/material.dart';

import 'DotPainterWidget.dart';

class Dot2DApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: DotPainterWidget(MediaQuery.of(context).size)),
    );
  }
}
