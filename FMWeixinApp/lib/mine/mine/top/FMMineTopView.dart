import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMMineTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          color: FMColors.wx_gray,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_camera, color: Colors.blue,),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text('拍一个视频动态',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}