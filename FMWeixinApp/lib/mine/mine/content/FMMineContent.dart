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
  }

  void _initModels(){
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/mine/mine_pay.png', '支付', 'function', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/mine/mine_collection.png', '收藏', '', true));
    _models.add(FMFindModel('assets/images/mine/mine_album.png', '相册', '', true));
    _models.add(FMFindModel('assets/images/mine/mine_wallet.png', '卡包', '', true));
    _models.add(FMFindModel('assets/images/mine/mine_face.png', '表情', '', false));
    _models.add(FMFindModel('', '', 'divid', false));
    _models.add(FMFindModel('assets/images/mine/mine_setting.png', '设置', '', false));
  }

  void _intItems(){

    _items.add(
        Container(
          height: 200,
          child: FMMineHeader(),
        ),
    );

    _models.forEach((model) {
      if (model.type == 'divid') {
        _items.add(Padding(padding: EdgeInsets.only(top: 10),));
      } else {
        _items.add(
            Container(
              height: 60.0,
              child: FMFindItem(
                model: model,
                onTap: (model){
                  print('${model.title}');
                },
              ),
            ),
        );
      }
    });
  }
}