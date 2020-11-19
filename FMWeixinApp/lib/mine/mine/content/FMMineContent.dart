import 'package:FMWeixinApp/find/item/FMFindItem.dart';
import 'package:FMWeixinApp/find/model/FMFindModel.dart';
import 'package:FMWeixinApp/mine/mine/item/FMMineHeader.dart';
import 'package:flutter/material.dart';

class FMMineContent extends StatelessWidget{

  List <FMFindModel> _models = [];
  List <Widget> _items = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    _initModels();
    _intItems();

    return Column(
      children: _items,
    );



    return ListView.builder(
      itemCount: _models.length + 1,
      itemBuilder: (context ,index){
        if (index == 0) {
          return Container(
            height: 150,
            child: FMMineHeader(),
          );
        }

        FMFindModel model = _models[index - 1];
        if (model.type == 'divid') {
          return Padding(padding: EdgeInsets.only(top: 10));
        }
        return Container(
          height: 60.0,
          child: FMFindItem(model),
        );
      },
    );
  }

  void _initModels(){
    _models.add(FMFindModel('', '', 'divid'));
    _models.add(FMFindModel('assets/images/mine/mine_pay.png', '支付', 'function'));
    _models.add(FMFindModel('', '', 'divid'));
    _models.add(FMFindModel('assets/images/mine/mine_collection.png', '收藏', ''));
    _models.add(FMFindModel('assets/images/mine/mine_album.png', '相册', ''));
    _models.add(FMFindModel('assets/images/mine/mine_wallet.png', '卡包', ''));
    _models.add(FMFindModel('assets/images/mine/mine_face.png', '表情', ''));
    _models.add(FMFindModel('', '', 'divid'));
    _models.add(FMFindModel('assets/images/mine/mine_setting.png', '设置', ''));
  }

  void _intItems(){

    _items.add(
        Container(
          height: 200,
          child: FMMineHeader(),
        ),
    );

    _items.add(Padding(padding: EdgeInsets.only(top: 10),));
    _models.forEach((model) {

      if (model.type == 'divid') {
        _items.add(Padding(padding: EdgeInsets.only(top: 10),));
      } else {
        _items.add(
            Container(
              height: 60.0,
              child: FMFindItem(model),
            ),
        );
      }
    });
  }
}