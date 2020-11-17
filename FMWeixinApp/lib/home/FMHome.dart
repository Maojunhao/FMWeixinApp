import 'package:FMWeixinApp/home/FMHomeManager.dart';
import 'package:FMWeixinApp/home/pages/FMPages.dart';
import 'package:FMWeixinApp/home/tabbar/FMTabBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FMHome extends StatefulWidget {
  @override
  FMHomeState createState()=> FMHomeState();
}

class FMHomeState extends State <FMHome> {

  FMHomeManager manager = FMHomeManager();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _scaffold();
  }

  Scaffold _scaffold(){
    return Scaffold(
      // TabBar
      bottomNavigationBar: ChangeNotifierProvider(
        create: (context)=> manager.tabBarManager,
        child: FMTabBar(),
      ),

      body: ChangeNotifierProvider(
        create: (context) => manager.pagesManager,
        child: FMPages(),
      ),
      // body: _body(),
    );
  }
}


