import 'package:flutter/material.dart';

class FMHomeManager with ChangeNotifier {
  // 下标
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}