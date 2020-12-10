import 'package:FMWeixinApp/contacts/contacts/content/FMContactContent.dart';
import 'package:FMWeixinApp/contacts/contacts/index/FMContactIndexes.dart';
import 'package:flutter/material.dart';

class FMMailList extends StatefulWidget {
  @override
  FMMailListState createState()=> FMMailListState();
}

class FMMailListState extends State <FMMailList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        elevation: 1.0,
      ),
      body: _stack(),
    );
  }

  Stack _stack(){
    return Stack(
      children: [
        FMContactContent(),
        Positioned(
          top: 100,
          bottom: 100,
          width: 30,
          right: 15,
          child: FMContactsIndexes(),
        ),
      ],
    );
  }
}