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
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _scaffold();
  }

  ChangeNotifierProvider _provider(){
    return ChangeNotifierProvider(
      create: (context) => FMHomeManager(),
      child: _scaffold(),
    );
  }

  Scaffold _scaffold(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      bottomNavigationBar: ChangeNotifierProvider(
        create: (context)=> manager,
        child: _tabBar(),
      ),
    );
  }

  FMTabBar _tabBar(){
    return FMTabBar(
      onTap: (index){

      },
    );
  }
}

class FMHomeManager with ChangeNotifier {
  int selectedIndex = 0;
}


