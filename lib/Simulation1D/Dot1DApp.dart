import 'package:flutter/material.dart';

import 'MovingDotWidget.dart';

class Dot1DApp extends StatelessWidget {
  const Dot1DApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: MovingDotWidget(),
          ),
        ),
      ),
    );
  }
}
