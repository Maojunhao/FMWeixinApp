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

  List <FMFindMenuModel> _menuModels = [];

  @override
  void initState() {
    // TODO: implement initState
    _models.clear();

    _initModels();
    _initMenuModels(_models);
    _initSliversWithModels(_models);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: _slivers,
    );
  }

  SliverAppBar _sliverAppBar(){
    return SliverAppBar(
      title: Text('发现',
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: FMColors.wx_gray,
      floating: true,
      pinned: true,
      elevation: 0.0,
    );
  }

  // 功能 Items
  SliverFixedExtentList _sliverFixedExtentList(FMFindMenuModel menuModel){
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => FMFindItem(
              model: menuModel.models[index],
              onTap: (model){

              },
            ),
        childCount: menuModel.models.length,
      ),
      itemExtent: 60.0,
    );
  }

  // 空白 blank
  SliverFixedExtentList _sliverDividList(FMFindMenuModel menuModel){
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(padding: EdgeInsets.zero),
        childCount: menuModel.models.length,
      ),
      itemExtent: 10.0,
    );
  }

  void _initModels(){
    _models.add(FMFindModel('assets/images/find/find_friend.png', '朋友圈', 'function', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/find/find_scan.png', '扫一扫', '', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/find/find_look.png', '看一看', '', true));
    _models.add(FMFindModel('assets/images/find/find_search.png', '搜一搜', '', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/find/find_game.png', '游戏', '', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/find/find_small_project.png', '小程序', '', false));
  }

  void _initSliversWithModels(models){
    _slivers.add(_sliverAppBar());

    _menuModels.forEach((menuModel) {
      if (menuModel.dividModel) {
        _slivers.add(_sliverDividList(menuModel));
      } else {
        _slivers.add(_sliverFixedExtentList(menuModel));
      }
    });
  }

  void _initMenuModels(List <FMFindModel> items){
    List <FMFindModel> _tempModels = [];
    items.forEach((model) {
      if (model.type == 'divid') {
        _menuModels.add(new FMFindMenuModel(_tempModels));
        _tempModels.clear();
        _tempModels.add(model);
        FMFindMenuModel menuModel = new FMFindMenuModel(_tempModels);
        menuModel.dividModel = true;
        _menuModels.add(menuModel);
        _tempModels.clear();
      } else {
        _tempModels.add(model);
      }
    });

    if (_tempModels.length > 0) {
      _menuModels.add(new FMFindMenuModel(_tempModels));
      _tempModels.clear();
    }
  }
}