import 'package:FMWeixinApp/common/FMTableView/FMTableView.dart';
import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class FMContactContent extends StatefulWidget {
  @override
  FMContactContentState createState() => FMContactContentState();
}

List _elements = [
  {'name': 'John', 'group': 'Team A'},
  {'name': 'Will', 'group': 'Team B'},
  {'name': 'Beth', 'group': 'Team A'},
  {'name': 'Miranda', 'group': 'Team B'},
  {'name': 'Mike', 'group': 'Team C'},
  {'name': 'Danny', 'group': 'Team C'},
  {'name': 'Mike', 'group': 'Team C'},
  {'name': 'Danny', 'group': 'Team C'},
  {'name': 'Mike', 'group': 'Team C'},
  {'name': 'Danny', 'group': 'Team C'},
  {'name': 'Mike', 'group': 'Team C'},
  {'name': 'Danny', 'group': 'Team C'},
  {'name': 'Danny', 'group': 'Team D'},
  {'name': 'Mike', 'group': 'Team D'},
  {'name': 'Danny', 'group': 'Team D'},
  {'name': 'Danny', 'group': 'Team E'},
  {'name': 'Mike', 'group': 'Team E'},
  {'name': 'Danny', 'group': 'Team E'},
];

class FMContactContentState extends State <FMContactContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScrollController _controller = ScrollController(
      initialScrollOffset: 150,
    );

    GroupedListView _listView = GroupedListView(
      elements: _elements,
      groupBy: (element){
        return element['group'];
      },
      controller: _controller,
      groupSeparatorBuilder: (value) {
        print('$value');
        return Container(
          alignment: Alignment.centerLeft,
          color: FMColors.wx_gray,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: FMColors.wx_text_gray),
            ),
          ),
        );
      } ,
      floatingHeader: false,
      stickyHeaderBackgroundColor: Colors.red,
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) =>
          item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      itemBuilder: (c , element){
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.account_circle),
              title: Text(element['name']),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
    );



    FMTableView _tableView = FMTableView(
      numberOfRowsInSection: (context, index) {
        return 10;
      },
      numberOfSections: (context) {
        return 3;
      },
      itemForRowAtIndexPath: (context, indexPath){
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0),
              leading: Icon(Icons.account_circle),
              title: Text("indexPath section = ${indexPath.section}, row = ${indexPath.row}"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        );
      },
      widgetForHeaderInSection: (context, section){
        print("section");
        return Container(
          alignment: Alignment.center,
          color: Colors.brown,
          child: Text("Header $section"),
        );
      },

      heightForHeaderInSection: (context, section){
        return 50;
      },
      heightForRowAtIndexPath: (context, indexPath){
        return 60;
      },
    );



    return _tableView;
  }
}