import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMMineHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Positioned(
          left: 20,
          top: 100,
          child: _infoRow(),
        ),
        Positioned(
          right: 15,
          top: 148,
          child: _scanRow(),
        ),
      ],
    );
  }
  
  Row _infoRow(){
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Image.network('http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg'),
        ),
        Padding(padding: EdgeInsets.only(left: 15),),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Flutter 微信咯',
                style:  TextStyle(
                  color: FMColors.wx_black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('微信号: Maojunhao',
                style: TextStyle(
                  color: FMColors.wx_black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _scanRow(){
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Image(image: AssetImage('assets/images/mine/mine_scan.png'),),
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        SizedBox(
          width: 10,
          height: 20,
          child: Image(image: AssetImage('assets/images/find/find_arrow_right.png')),
        ),
      ],
    );
  }
}