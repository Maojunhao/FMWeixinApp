import 'package:FMWeixinApp/home/FMHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FMTabBar extends StatefulWidget {
  ValueChanged<int> onTap;
  VoidCallback callback;
  FMHomeManager manager;

  FMTabBar({Key key, this.onTap, this.manager}) : super(key : key);

  @override
  FMTabBarState createState()=> FMTabBarState();
}

class FMTabBarState extends State <FMTabBar> {

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return _bottomNavigationBar();
    // var manager = context.read<FMHomeManager>();

    // TODO: implement build
    return Consumer<FMHomeManager>(builder: (context, manager, child){

      print(manager.selectedIndex);
      return _bottomNavigationBar();
    });
  }

  BottomNavigationBar _bottomNavigationBar(){
    return BottomNavigationBar(
      // items
      items: [
        _createItem(AssetImage('assets/images/tab/tab_weixin.png'), AssetImage('assets/images/tab/tab_weixin_green.png'), '微信'),
        _createItem(AssetImage('assets/images/tab/tab_mail_list.png'), AssetImage('assets/images/tab/tab_mail_list_green.png'), '通讯录'),
        _createItem(AssetImage('assets/images/tab/tab_find.png'), AssetImage('assets/images/tab/tab_find_green.png'), '发现'),
        _createItem(AssetImage('assets/images/tab/tab_mine.png'), AssetImage('assets/images/tab/tab_mine_green.png'), '我的'),
      ],
      // 选中 index
      currentIndex: selectedIndex,

      // 点击事件
      onTap: (index){

      },

      // 固定大小，取消自适应偏移
      type: BottomNavigationBarType.fixed,

      // 字体颜色
      unselectedItemColor: Color.fromRGBO(51, 51, 51, 1),
      selectedItemColor: Color.fromRGBO(0, 186, 85, 1),

      // 字体大小
      selectedFontSize: 15,
      unselectedFontSize: 15,

      // 未选中时显示 title
      showUnselectedLabels: true,
    );
  }


  BottomNavigationBarItem _createItem(AssetImage image, AssetImage selectedImage, String title){
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: image),
      ),
      activeIcon: SizedBox(
        width: 30,
        height: 30,
        child: Image(image: selectedImage),
      ),
      title: Text('$title'),
    );
  }
}