import 'package:flutter/material.dart';
import 'package:esptouch/viewmodels/homeinfodata.dart';
import 'package:esptouch/dialwidget/controlknob.dart';
import 'dart:math';
import 'radial_drag_gesture_detector.dart';

class CircleGestureDetector extends StatefulWidget {
  final HomeInfoData infoModel;
  final int index;

  CircleGestureDetector({required this.infoModel, required this.index});

  @override
  _CircleGestureDetectorState createState() => _CircleGestureDetectorState();
}

class _CircleGestureDetectorState extends State<CircleGestureDetector> {
  PolarCoord? _startDragCoord;
  late double _startDragPreCent;
  late double _currentDragPreCent;

  _onRadialDragStart(PolarCoord coord) {
    _startDragCoord = coord;
    _startDragPreCent = widget.infoModel.infoModel(widget.index).knobReading;
  }

  _onRadialDragUpdate(PolarCoord coord) {
    if (_startDragCoord != null) {
      final dragAngle = coord.angle - _startDragCoord!.angle;
      final dragPreCent = dragAngle / (2 * pi);
      final dragValue = (_startDragPreCent + dragPreCent) % 1.0.clamp(0.0, 0.5);
      final max1 = (dragValue * 31 * 2).round();

      setState(() {
        final bool isFanOn = widget.infoModel.infoData[widget.index].isFanOn;
        if (isFanOn) {
          _currentDragPreCent = dragValue;
          widget.infoModel.setKnobPreCent(
              widget.infoModel.infoData[widget.index], _currentDragPreCent);
          widget.infoModel
              .changeTemp(widget.infoModel.infoModel(widget.index), max1);
          print('darcoord: $max1');
        }
      });
    }
  }

  onRadialDragEnd() {
    final bool isFanOn = widget.infoModel.infoData[widget.index].isFanOn;
    if (isFanOn) {
      setState(() {
        _currentDragPreCent = 0.0;
        _startDragCoord = null;
        _startDragPreCent = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetector(
      onRadialDragStart: _onRadialDragStart,
      onRadialDragUpdate: _onRadialDragUpdate,
      onRadialDragEnd: onRadialDragEnd,
      child: ControlKnob(widget.infoModel.getKnobReading(widget.index)),
    );
  }
}
