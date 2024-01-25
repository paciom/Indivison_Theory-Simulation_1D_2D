import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_simulator/Common/ColorGenerator.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/CollisionDotsFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/DuplicatePatternFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleFinder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleGrouper.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleNamer.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticlePatternChecker.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/ParticleRecorder.dart';
import 'package:light_simulator/Simulation2D/ParticleFinding/PatternFinder.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/AppStateConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/Dot2DMapConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/DotDataConverter.dart';
import 'package:light_simulator/Simulation2D/ProtobufConverters/ParticleConverter.dart';
import 'package:light_simulator/Simulation2D/RandomDotsGenerator.dart';
import 'package:light_simulator/UI/UiFactory.dart';

import 'DotPainterWidget.dart';
import 'DotSimulator2D.dart';
import 'Models/AppState.dart';

class DotPainterWidgetState extends State<DotPainterWidget> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  bool isInitialized = false;
  late AppState _state;
  final UiFactory _uiFactory;
  late DotSimulator2D _dotSimulator2D;
  final Size _size;
  late final TextEditingController _dotRadiusController;
  late final TextEditingController _seedController;
  late final TextEditingController _dotCountController;
  late final TextEditingController _initialAreaWidthController;
  late final TextEditingController _initialAreaHeightController;

  late AppStateConverter _appStateConverter;
  late ParticleFinder _particleFinder;
  late ParticleRecorder _particleRecorder;
  late ParticleConverter _particleConverter;

  String? _directory;

  DotPainterWidgetState(
    this._size,
    this._uiFactory,
  );

  void startSimulation(AppState state) {
    _state = state;
    var random = Random(state.data.seed);
    var colorGenerator = ColorGenerator(random);
    var dotsGenerator = RandomDotsGenerator(state, random);

    _state.ui.size = _size;
    var dot2dConverter = Dot2DConverter();

    _particleConverter = ParticleConverter(
      dot2dConverter,
      _state,
    );
    _appStateConverter = AppStateConverter(DotDataConverter(Dot2DMapConverter(dot2dConverter)));
    _particleFinder = ParticleFinder(
        PatternFinder(DuplicatePatternFinder()), CollisionDotsFinder(_state), ParticleGrouper(ParticleNamer()), ParticlePatternChecker());
    _particleRecorder = ParticleRecorder(_state, _particleFinder, _particleConverter);
    _dotSimulator2D = DotSimulator2D(state, dotsGenerator, colorGenerator);
  }

  @override
  void initState() {
    super.initState();

    startSimulation(AppState());
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 60))
      ..addListener(() {
        setState(() {
          _dotSimulator2D.update();

          _particleRecorder.addFrozenParticles();
        });
      })
      ..repeat();

    _seedController = TextEditingController(text: _state.data.seed.toString());
    _seedController.addListener(() {
      var data = _state.data;
      data.seed = int.parse(_seedController.text);
    });

    _dotCountController = TextEditingController(text: _state.data.numberOfDots.toString());
    _dotCountController.addListener(() {
      var data = _state.data;
      data.numberOfDots = int.parse(_dotCountController.text);
    });

    _initialAreaWidthController = TextEditingController(text: _state.data.initialAreaWidth.toString());
    _initialAreaWidthController.addListener(() {
      var data = _state.data;
      data.initialAreaWidth = (int.tryParse(_initialAreaWidthController.text) ?? 10.0).toDouble();
    });

    _initialAreaHeightController = TextEditingController(text: _state.data.initialAreaHeight.toString());
    _initialAreaHeightController.addListener(() {
      var data = _state.data;
      data.initialAreaHeight = (int.tryParse(_initialAreaHeightController.text) ?? 100).toDouble();
    });

    _dotRadiusController = TextEditingController(text: _state.ui.dotPaintRadius.toString());
    _dotRadiusController.addListener(() {
      var ui = _state.ui;
      ui.dotPaintRadius = double.parse(_dotRadiusController.text);
      if (ui.dotPaintRadius > 50) {
        ui.dotPaintRadius = 50;
      }
      if (ui.dotPaintRadius < 0.5) {
        ui.dotPaintRadius = 0.5;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      isInitialized = true; // Set the flag to true after initialization
    }
  }

  void toggleConnection() {
    _state.ui.showConnection = !_state.ui.showConnection;
  }

  void toggleTrail() {
    _state.ui.showPositionHistory = !_state.ui.showPositionHistory;
  }

  void findParticles() {
    // var particles = _particleFinder.findParticles(_state.data.dots);

    // }
  }

  void reverseCourse() {
    for (var dot in _state.data.dots.values) {
      dot.direction = -dot.direction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerSignal: (signal) {
            if (signal is PointerScrollEvent) {
              final delta = signal.scrollDelta;
              setState(() {
                var ui = _state.ui;
                ui.scaleCenter = signal.position;
                ui.scale *= (1 - delta.dy * 0.0002);
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
                  var ui = _state.ui;
                  ui.panCenter = ui.panCenter.translate(details.delta.dx / ui.scale, details.delta.dy / ui.scale);
                });
              },
              child: CustomPaint(
                painter: _dotSimulator2D.painter,
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
                onPressed: toggleConnection,
                text: _state.ui.showConnection ? 'Hide Entanglement' : 'Show Entanglement',
                tooltip: _state.ui.showConnection ? 'Hide Entanglement' : 'Show Entanglement',
              ),
              _uiFactory.TooltipButton(
                onPressed: toggleTrail,
                text: _state.ui.showPositionHistory ? 'Hide Trail' : 'Show Trail',
                tooltip: _state.ui.showPositionHistory ? 'Hide Trail' : 'Show Trail',
              ),
              // TooltipButton(
              //   onPressed: toggleEntanglement,
              //   text: settings.showEntanglement ? 'Hide Entanglement' : 'Show Entanglement',
              //   tooltip: settings.showEntanglement ? 'Hide Entanglement' : 'Show Entanglement',
              // ),
              _uiFactory.TooltipButton(onPressed: reverseCourse, text: 'Reverse Course', tooltip: 'Reverse Course'),
              _uiFactory.TooltipButton(onPressed: findParticles, text: 'Find Particles', tooltip: 'Find Particles'),

              _uiFactory.TooltipButton(onPressed: saveFile, text: 'Save', tooltip: 'Save File'),
              _uiFactory.TooltipButton(onPressed: restart, text: 'Restart', tooltip: 'Restart'),
              _uiFactory.TooltipButton(onPressed: previousSeed, text: '<', tooltip: 'Previous Seed'),
              _uiFactory.TooltipButton(onPressed: nextSeed, text: '>', tooltip: 'Next Seed'),
              // TooltipButton(onPressed: zoomIn, text: 'Z+', tooltip: 'Zoom In'),
              // TooltipButton(onPressed: zoomOut, text: 'Z-', tooltip: 'Zoom Out'),
              _uiFactory.TooltipButton(
                onPressed: pause,
                text: _state.ui.running ? '||' : '|>',
                tooltip: _state.ui.running ? 'Pause' : 'Resume',
              ),
              // NumberInput(controller: _numberOfDotsController, labelText: 'Number of Dots'),
              // NumberInput(controller: _seedController, labelText: 'Seed'),
              // NumberInput(controller: _startPointWidthController, labelText: 'Starting Width'),
              _uiFactory.NumberInput(controller: _seedController, labelText: 'Random Seed'),
              _uiFactory.NumberInput(controller: _dotCountController, labelText: 'Number of Dots'),
              _uiFactory.NumberInput(controller: _dotRadiusController, labelText: 'Dot Painting Radius'),

              _uiFactory.NumberInput(controller: _initialAreaWidthController, labelText: 'Start Area Width'),
              _uiFactory.NumberInput(controller: _initialAreaHeightController, labelText: 'Start Area Height'),
              Text("Time: ${_state.data.time}")
            ],
          ),
        ),
      ],
    );
  }

  Future<void> saveFile() async {
    // Use file_picker to let the user select a save directory.
    _directory ??= await FilePicker.platform.getDirectoryPath();

    if (_directory != null) {
      // Ask the user for a filename.
      // String? fileName = await pickFolder();
      var data = _state.data;
      var now = DateTime.now();
      String fileName =
          "${data.dots.length.toString().padLeft(6, "0")}${data.initialAreaHeight}x${data.initialAreaWidth}_${DateFormat("yyyyMMdd-HHmmss").format(now)}_${data.time.toString().padLeft(10, "0")}";

      saveAppState(fileName);
    }
  }

  void saveAppState(String fileName) {
    String fullPath = '$_directory/$fileName.z2d';
    if (kDebugMode) {
      print(fullPath);
    }

    File newFile = File(fullPath);

    var pbAppState = _appStateConverter.toProto(_state);

    List<int> bytes = pbAppState.writeToBuffer();

    newFile.writeAsBytesSync(bytes);
  }

  Future<String?> pickFolder() async {
    String? fileName = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController fileNameController = TextEditingController();
        return AlertDialog(
          title: Text('Enter filename'),
          content: TextField(
            controller: fileNameController,
            decoration: InputDecoration(labelText: 'Filename'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () => Navigator.of(context).pop(fileNameController.text),
            ),
          ],
        );
      },
    );
    return fileName;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void previousSeed() {}

  void nextSeed() {}

  void pause() {
    _state.ui.running = !_state.ui.running;
  }

  void restart() {
    _state.data.dots = {};
    _state.ui.size = _size;
    startSimulation(_state);
  }
}
