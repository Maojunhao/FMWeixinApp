import 'package:FMWeixinApp/home/FMHome.dart';
import 'package:FMWeixinApp/home/FMHomeManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FMPages extends StatefulWidget {
  @override
  FMPagesState createState()=> FMPagesState();
}

class FMPagesState extends State <FMPages> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<FMPagesManager>(builder: (context, manager, child){
      return manager.pages[manager.selectedPage];
    });
  }
}