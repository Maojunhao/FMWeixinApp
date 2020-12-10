import 'package:flutter/cupertino.dart';

class FMFindModel {
  String imageName;
  String title;
  // 分割线
  bool hasDivid;
  // type
  String type;

  FMFindModel(this.imageName, this.title, this.type, this.hasDivid);
}

class FMFindMenuModel {
  // 是否为分隔单位
  bool dividModel = false;
  //
  List <FMFindModel> _models = [];
  List <FMFindModel> get models => _models;

  FMFindMenuModel(List <FMFindModel> models) {
    _models.clear();
    models.forEach((model) {
      _models.add(model);
    });
  }
}