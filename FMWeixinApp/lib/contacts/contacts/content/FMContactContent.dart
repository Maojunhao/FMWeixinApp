import 'package:FMWeixinApp/tools/FMColor.dart';
import 'package:flutter/material.dart';
import 'package:ui_tableview/ui_tableview.dart';

const List _sections = ['星标', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',];

class FMContactContent extends StatefulWidget {
  @override
  FMContactContentState createState() => FMContactContentState();
}

class FMContactContentState extends State <FMContactContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    UITableView _contacts(){
      int _numberOfRowsInSection(context, index){
        return 4;
      }

      int _numberOfSections(context){
        return _sections.length + 1;
      }

      Widget _itemForRowAtIndexPath(context, UIIndexPath indexPath){
        String text;
        Image image;

        if (indexPath.section == 0) {
          if (indexPath.row == 0) {
            text = '新的朋友';
            image = Image.asset('assets/images/contacts/contacts_new_friend.png');
          } else if (indexPath.row == 1) {
            text = '群聊';
            image = Image.asset('assets/images/contacts/contacts_grouped.png');
          } else if (indexPath.row == 2) {
            text = '标签';
            image = Image.asset('assets/images/contacts/contacts_tag.png');
          } else if (indexPath.row == 3) {
            text = '公众号';
            image = Image.asset('assets/images/contacts/contacts_public.png');
          }

          print(image);

        } else {
          text = "小小  ${_sections[indexPath.section - 1]} - ${indexPath.row}";
          image = Image.network('https://gss0.bdstatic.com/6LZ1dD3d1sgCo2Kml5_Y_D3/sys/portrait/item/tb.1.2c0e048.VFUJtjrbQl4EwWKNr0H0GA?t=1497799370');
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Colors.white,),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Container(
                  padding: EdgeInsets.all(5),
                  child: image,
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text( text, style: TextStyle( fontSize: 18, ), )
              ],
            ),
            Positioned(child: Divider(height: 2,),bottom: 0, left: 80,right: 0,),
          ],
        );
      }

      Widget _widgetForHeaderInSection(context, section){
        if (section == 0) return Container();

        return Container(
          alignment: Alignment.centerLeft,
          color: FMColors.wx_gray,
          padding: EdgeInsets.only(left: 20),
          child: Text("${_sections[section - 1]}"),
        );
      }

      Widget _widgetForHoverHeader(context, section){
        if (section == 0) return Container();

        return Container(
          alignment: Alignment.centerLeft,
          color: FMColors.wx_green,
          padding: EdgeInsets.only(left: 20),
          child: Text("${_sections[section - 1]}", style: TextStyle(color: Colors.green),),
        );
      }

      double _heightForHeaderInSection(context, section){
        if (section == 0) return 0;
        return 30;
      }

      double _heightForRowAtIndexPath(context, indexPath){
        return 55;
      }

      return UITableView(
        numberOfRowsInSection: _numberOfRowsInSection,
        numberOfSections: _numberOfSections,
        itemForRowAtIndexPath: _itemForRowAtIndexPath,
        widgetForHeaderInSection: _widgetForHeaderInSection,
        heightForRowAtIndexPath: _heightForRowAtIndexPath,

        heightForHeaderInSection: _heightForHeaderInSection,
        widgetForHoverHeader: _widgetForHoverHeader,
      );
    }

    return _contacts();
  }
}