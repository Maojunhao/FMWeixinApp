import 'package:flutter/material.dart';

const List _sections = ['星标', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',];

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

    _sections.forEach((title) {
      widgests.add(Text('$title'));
    });

    return widgests;
  }
}