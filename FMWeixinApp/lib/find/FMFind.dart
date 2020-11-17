import 'package:FMWeixinApp/find/item/FMFindItem.dart';
import 'package:FMWeixinApp/find/model/FMFindModel.dart';
import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';

class FMFind extends StatefulWidget {
  @override
  FMFindState createState()=> FMFindState();
}

class FMFindState extends State <FMFind> {

  List<Widget> _slivers = [];

  List <FMFindModel> _models = [];

  @override
  void initState() {
    // TODO: implement initState
    _models.clear();

    _models.add(FMFindModel('assets/images/find/find_friend.png', '朋友圈'));
    _models.add(FMFindModel('assets/images/find/find_scan.png', '扫一扫'));
    _models.add(FMFindModel('assets/images/find/find_look.png', '看一看'));
    _models.add(FMFindModel('assets/images/find/find_search.png', '搜一搜'));
    _models.add(FMFindModel('assets/images/find/find_game.png', '游戏'));
    _models.add(FMFindModel('assets/images/find/find_small_project.png', '小程序'));

    _initSliversWithModels(_models);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CustomScrollView(
      slivers: _slivers,
    );

    // return CustomScrollView(
    //   slivers: [
    //     SliverAppBar(
    //       title: Text('发现'),
    //       backgroundColor: FMColors.wx_gray,
    //       floating: true,
    //       pinned: true,
    //     ),
    //     SliverFixedExtentList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) => FMFindItem(),
    //         childCount: 3,
    //       ),
    //       itemExtent: 60.0,
    //     ),
    //     SliverFixedExtentList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) => Padding(padding: EdgeInsets.only(top: 10)),
    //         childCount: 1,
    //       ),
    //       itemExtent: 10.0,
    //     ),
    //     SliverFixedExtentList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) => FMFindItem(),
    //         childCount: 3,
    //       ),
    //       itemExtent: 60.0,
    //     ),
    //   ],
    // );
  }

  void _initSliversWithModels(models){
    _slivers.add(_sliverAppBar());
    _slivers.add(_sliverFixedExtentList());
  }

  SliverAppBar _sliverAppBar(){
    return SliverAppBar(
      title: Text('发现'),
      backgroundColor: FMColors.wx_gray,
      floating: true,
      pinned: true,
    );
  }

  SliverFixedExtentList _sliverFixedExtentList(){
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => FMFindItem(_models[index]),
        childCount: _models.length,
      ),
      itemExtent: 60.0,
    );
  }
}