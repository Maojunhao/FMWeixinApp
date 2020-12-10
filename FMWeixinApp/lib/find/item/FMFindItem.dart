import 'package:FMWeixinApp/find/model/FMFindModel.dart';
import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMFindItem extends StatefulWidget {
  final FMFindModel model;
  final void Function(FMFindModel model) onTap;
  const FMFindItem({
    Key key,
    this.model,
    this.onTap,
  }):super(key: key);

  @override
  FMFindItemState createState()=> FMFindItemState();
}

class FMFindItemState extends State <FMFindItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: GestureDetector(
        onTap: (){
          if (widget.onTap != null) widget.onTap(widget.model);
        },
        child: _stack(),
      ),
    );
  }

  Stack _stack(){
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: _container(),
        ),
        Positioned(
          bottom: 0,
          height: 1,
          left: 60,
          right: 0,
          child: Divider(color: FMColors.wx_gray, thickness: 1,),
        ),
      ],
    );
  }

  Container _container(){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: _row(),
      ),
      color: Colors.white,
    );
  }

  Row _row(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image(image: AssetImage('${widget.model.imageName}')),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text('${widget.model.title}',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        Expanded(child: Padding(padding: EdgeInsets.zero)),
        SizedBox(
          width: 12,
          height: 30,
          child: Image(image: AssetImage('assets/images/find/find_arrow_right.png')),
        ),
      ],
    );
  }
}