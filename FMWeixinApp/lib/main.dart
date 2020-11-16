import 'package:FMWeixinApp/home/FMHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FMWeixinApp());
}

class FMWeixinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'FMWeixinApp',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(233, 234, 235, 1.0),
      ),
      home: FMHome(),
    );
  }
}
