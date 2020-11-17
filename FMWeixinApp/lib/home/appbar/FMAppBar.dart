import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FMAppBar extends StatefulWidget {
  @override
  FMAppBarState createState()=> FMAppBarState();
}

class FMAppBarState extends State <FMAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(builder: (context, manager, child){
        return AppBar();
      },
    );
  }
}