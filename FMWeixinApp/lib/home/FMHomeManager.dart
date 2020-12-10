import 'package:FMWeixinApp/chat/FMChat.dart';
import 'package:FMWeixinApp/find/FMFind.dart';
import 'package:FMWeixinApp/contacts/contacts/FMContacts.dart';
import 'package:FMWeixinApp/mine/mine/FMMine.dart';
import 'package:flutter/material.dart';

class FMHomeManager {
  // 单例模式
  static FMHomeManager _instance;
  static FMHomeManager get instance => _getInstance();
  factory FMHomeManager()=> _getInstance();
  FMHomeManager._init() {}
  static FMHomeManager _getInstance(){
    if(_instance == null) {
      print("init");
      _instance = new FMHomeManager._init();
    }
    return _instance;
  }

  // 下标
  var _selectedIndex = 0;

  // 下标 get, set
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index){
    _selectedIndex = index;
  }

  // PageManager
  FMPagesManager _pagesManager = FMPagesManager();
  FMPagesManager get pagesManager => _pagesManager;

  // TabBarManager
  FMTabBarManager _tabBarManager = FMTabBarManager(
      (index){
        FMHomeManager.instance.selectedIndex = index;
        FMHomeManager.instance.pagesManager.selectedPage = index;
        FMHomeManager.instance.notifyAll();
      }
  );
  FMTabBarManager get tabBarManager => _tabBarManager;

  // AppBar Manager
  FMAppBarManager _appBarManager = FMAppBarManager();
  FMAppBarManager get appBarManager => _appBarManager;

  // 发送通知
  void notifyAll(){
    _pagesManager.notifyListeners();
    _tabBarManager.notifyListeners();
  }
}

class FMPagesManager with ChangeNotifier {
  // FMHomeManager

  // 下标
  int _selectedPage = 0;

  // Pages
  List <Widget> _pages = [];

  // 构造方法
  FMPagesManager(){
    _initialPages();
  }

  // 下标
  int get selectedPage => _selectedPage;
  set selectedPage(int indext){
    _selectedPage = indext;
  }

  // Pages
  List <Widget> _initialPages(){
    _pages.add(FMChat());
    _pages.add(FMMailList());
    _pages.add(FMFind());
    _pages.add(FMMine());
    return _pages;
  }

  List <Widget> get pages => _pages;
}

class FMTabBarManager with ChangeNotifier {

  ValueChanged<int> _valueChanged;

  FMTabBarManager(this._valueChanged);

  // 下标
  int _selectedIndex = 0;

  // 下标 get, set
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index){
    _selectedIndex = index;
    this._valueChanged(index);
  }
}

class FMAppBarManager with ChangeNotifier {
  // 下标
  int _selectedIndex = 0;

  // 下标 get, set
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index){
    _selectedIndex = index;
  }
}