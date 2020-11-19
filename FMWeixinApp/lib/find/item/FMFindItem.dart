import 'package:FMWeixinApp/find/model/FMFindModel.dart';
import 'package:flutter/material.dart';

class FMFindItem extends StatefulWidget {
  FMFindModel model;
  FMFindItem(this.model);

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

        },
        child: _container(),
      ),
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