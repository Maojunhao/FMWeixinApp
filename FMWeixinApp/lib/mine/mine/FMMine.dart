import 'dart:async';
import 'dart:ui';

import 'package:FMWeixinApp/mine/mine/body/FMMineBody.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FMMine extends StatefulWidget {
  @override
  FMMineState createState()=> FMMineState();
}

class FMMineState extends State <FMMine> with SingleTickerProviderStateMixin {

  final StreamController<double> _streamController = StreamController();

  double _topY = 0;
  bool _hideTop = true;

  final double _contentHeight = window.physicalSize.height / 2.0 - 64;

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
                      _topY += details.delta.dy * (_hideTop ? 0.5 : 0.2 )
                  );
                }
                ..onEnd = (details) {
                  print('end');
                  _didHideTopWhenEndPanning();
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
          // print('topY $_topY');
          return FMMineBody(_topY);
        },
      ),
    );
  }

  // 滑动结束
  void _didHideTopWhenEndPanning(){
    if (!_hideTop) {
      if (_topY < _contentHeight - 100) {
        _hideTopWhenEndPaning();
      } else {
        _showTopWhenEndPanning();
      }
    } else {
      if (_topY > 200) {
        _showTopWhenEndPanning();
      } else {
        _hideTopWhenEndPaning();
      }
    }
  }

  // 隐藏 Header 动画
  void _hideTopWhenEndPaning(){
    _initAnimation(true);
    _startAnimation();
  }

  // 展示 Header 动画
  void _showTopWhenEndPanning(){
    _initAnimation(false);
    _startAnimation();
  }

  Animation <double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void  dispose(){
    _controller?.dispose();
    super.dispose();
  }

  // 初始化动画
  void _initAnimation(isHide){
    _animation = Tween<double>(
      begin: _topY,
      end: isHide ? 0 : _contentHeight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
      _streamController.sink.add(
          _topY = _animation.value
      );
    })..addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _streamController.sink.add(
            _topY = isHide ? 0 : _contentHeight
        );
        _hideTop = isHide;
      }
    });
  }

  // 执行动画
  Future _startAnimation() async {
    try {
      await _controller.forward(from: 0).orCancel;
    } on TickerCanceled {

    }
  }
}


