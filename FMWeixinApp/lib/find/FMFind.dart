import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMFind extends StatefulWidget {
  @override
  FMFindState createState()=> FMFindState();
}

class FMFindState extends State <FMFind> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('发现'),
          backgroundColor: FMColors.wx_gray,
          floating: true,
          pinned: true,
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index){
              return ListTile(
                onTap: (){

                },

              );

                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.primaries[(index % 18)],
                    child: Text('111'),
                  ),
                );
            },
          ),
          itemExtent: 80.0,
        ),
      ],
    );
  }
}