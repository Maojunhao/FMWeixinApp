import 'dart:async';
import 'dart:ui';

import 'package:FMWeixinApp/mine/mine/body/FMMineBody.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FMMine extends StatefulWidget {
  @override
  FMMineState createState()=> FMMineState();
}

class FMMineState extends State <FMMine> {

  final StreamController<double> _streamController = StreamController();

  double _topY = 0;
  bool _hideTop = true;

  final double _screenHeight = window.physicalSize.height / 2.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        PanGestureRecognizer : GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
              ()=>PanGestureRecognizer(),
              (PanGestureRecognizer instace){
                instace
                ..onStart = (details) {

                }
                ..onUpdate = (details) {
                  print('update');
                  _streamController.sink.add(
                      _topY += details.delta.dy * 0.5
                  );
                }
                ..onEnd = (details) {
                  _streamController.sink.add(
                      _topY = _calculationTopY()
                  );
                }
                ..onCancel = (){
                  print('cancel');
                }
                ..onDown = (details){
                  print('down');
                };
              },
        ),
      },
      child: StreamBuilder<double>(
        stream: _streamController.stream,
        initialData: _topY,
        builder: (context, snapShot){
          print('$_topY');
          return FMMineBody(_topY);
        },
      ),
    );
  }

  double _calculationTopY(){
    double offsetY = 0;

    print('$_screenHeight screen' );

    if (!_hideTop) {
      if (_topY < _screenHeight - 200 - 64) {
        offsetY = 0;
        _hideTop = true;
      }
    } else {
      if (_topY > 200) {
        offsetY = _screenHeight - 64;
        _hideTop = false;
      }
    }
    return offsetY;
  }
}