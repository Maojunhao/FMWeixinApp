import 'package:FMWeixinApp/mine/mine/content/FMMineContent.dart';
import 'package:FMWeixinApp/mine/mine/top/FMMineTopView.dart';
import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMMineBody extends StatelessWidget {
  double _offsetY = 0;
  FMMineBody(this._offsetY);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(color: FMColors.wx_gray,),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: _offsetY,
          child: FMMineTopView(),
        ),
        Positioned(
          top: _offsetY,
          left: 0,
          right: 0,
          bottom: 0,
          child: FMMineContent(),
        ),
      ],
    );
  }
}