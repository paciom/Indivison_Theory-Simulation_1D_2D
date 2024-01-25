import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:light_simulator/Simulation1D/DotSimulator1D.dart';
import 'package:light_simulator/UI/UiFactory.dart';

import 'MovingDotWidget.dart';
import 'Settings.dart';

class MovingDotWidgetState extends State<MovingDotWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late DotSimulator1D _simulator1d;
  late final TextEditingController _seedController;
  late final TextEditingController _numberOfDotsController;
  late final TextEditingController _startPointWidthController;
  late final TextEditingController _maxHistoryController;
  late final TextEditingController _dotRadiusController;
  late final UiFactory _uiFactory;

  @override
  void initState() {
    super.initState();
    _simulator1d = DotSimulator1D(Settings());
    _controller = AnimationController(
      duration: const Duration(microseconds: 10),
      vsync: this,
    )..addListener(updateDots);
    _seedController = TextEditingController(text: _simulator1d.settings.seed.toString());
    _numberOfDotsController = TextEditingController(text: _simulator1d.settings.numberOfDots.toString());
    _startPointWidthController = TextEditingController(text: _simulator1d.settings.maxInitialPosition.toString());
    _maxHistoryController = TextEditingController(text: _simulator1d.settings.maxHistory.toString());
    _dotRadiusController = TextEditingController(text: _simulator1d.settings.dotPaintRadius.toString());
    _uiFactory = UiFactory();
    _controller.repeat();
  }

  void restart() {
    int seed = getInt(_seedController);
    startSeed(seed);
  }

  void startSeed(int newSeed) {
    _seedController.text = newSeed.toString();
    var settings = Settings();
    settings.seed = newSeed;
    settings.numberOfDots = getInt(_numberOfDotsController);
    settings.maxInitialPosition = getInt(_startPointWidthController);
    settings.maxHistory = getInt(_maxHistoryController);
    settings.dotPaintRadius = getDouble(_dotRadiusController);
    _simulator1d = DotSimulator1D(settings);
  }

  double getDouble(TextEditingController controller) {
    var seedStr = controller.value;

    var seed = seedStr.text == "" ? 0.0 : double.parse(seedStr.text);
    return seed;
  }

  int getInt(TextEditingController controller) {
    var seedStr = controller.value;

    var seed = seedStr.text == "" ? 0 : int.parse(seedStr.text);
    return seed;
  }

  void nextSeed() {
    int seed = getInt(_seedController);
    startSeed(seed + 1);
  }

  void previousSeed() {
    int seed = getInt(_seedController);
    startSeed(seed - 1);
  }

  void zoomIn() {
    _simulator1d.settings.scale *= 1.1;
  }

  void zoomOut() {
    _simulator1d.settings.scale /= 1.1;
  }

  void pause() {
    _simulator1d.settings.running = !_simulator1d.settings.running;
  }

  @override
  Widget build(BuildContext context) {
    var settings = _simulator1d.settings;
    var time = settings.time;
    return Stack(
      children: [
        Listener(
          onPointerSignal: (signal) {
            if (signal is PointerScrollEvent) {
              final delta = signal.scrollDelta;
              setState(() {
                settings.scale *= (1 - delta.dy * 0.002);
              });
            }
          },
          child: MouseRegion(
            onHover: (event) {
              // When mouse is hovering over, it sets the state so that cursor becomes 'grab'
              setState(() {});
            },
            cursor: SystemMouseCursors.grab,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  settings.dragOffset = settings.dragOffset.translate(details.delta.dx, details.delta.dy);
                });
              },
              child: CustomPaint(
                painter: _simulator1d.painter,
                child: Container(),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _uiFactory.TooltipButton(
                onPressed: toggleHistory,
                text: settings.showHistory ? 'Hide History' : 'Show History',
                tooltip: settings.showHistory ? 'Hide History' : 'Show History',
              ),
              _uiFactory.TooltipButton(
                onPressed: toggleEntanglement,
                text: settings.showEntanglement ? 'Hide Entanglement' : 'Show Entanglement',
                tooltip: settings.showEntanglement ? 'Hide Entanglement' : 'Show Entanglement',
              ),
              _uiFactory.TooltipButton(onPressed: restart, text: 'Restart', tooltip: 'Restart'),
              _uiFactory.TooltipButton(onPressed: previousSeed, text: '<', tooltip: 'Previous Seed'),
              _uiFactory.TooltipButton(onPressed: nextSeed, text: '>', tooltip: 'Next Seed'),
              _uiFactory.TooltipButton(onPressed: zoomIn, text: 'Z+', tooltip: 'Zoom In'),
              _uiFactory.TooltipButton(onPressed: zoomOut, text: 'Z-', tooltip: 'Zoom Out'),
              _uiFactory.TooltipButton(
                onPressed: pause,
                text: settings.running ? '||' : '|>',
                tooltip: settings.running ? 'Pause' : 'Resume',
              ),
              _uiFactory.NumberInput(controller: _numberOfDotsController, labelText: 'Number of Dots'),
              _uiFactory.NumberInput(controller: _seedController, labelText: 'Seed'),
              _uiFactory.NumberInput(controller: _startPointWidthController, labelText: 'Starting Width'),
              _uiFactory.NumberInput(controller: _dotRadiusController, labelText: 'Dot Painting Radius'),
              Text("Time: $time")
            ],
          ),
        ),
      ],
    );
  }

  void updateDots() {
    setState(() {
      _simulator1d.update();
    });
  }

  void toggleHistory() {
    setState(() {
      _simulator1d.settings.showHistory = !_simulator1d.settings.showHistory;
    });
  }

  void toggleEntanglement() {
    setState(() {
      _simulator1d.settings.showEntanglement = !_simulator1d.settings.showEntanglement;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
