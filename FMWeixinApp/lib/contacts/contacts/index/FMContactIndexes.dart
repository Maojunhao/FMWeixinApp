import 'package:flutter/material.dart';

class FMContactsIndexes extends StatefulWidget {
  @override
  FMContactsIndexesState createState() => FMContactsIndexesState();
}

class FMContactsIndexesState extends State <FMContactsIndexes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _indexes(),
    );
  }

  List <Widget> _indexes(){
    List <Widget> widgests = [];

    for (int i=0; i < 20; i++){
      widgests.add(Text('${i+1}'));
    }

    return widgests;
  }
}