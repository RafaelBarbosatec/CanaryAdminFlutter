import 'package:canary_admin/ButtonMenu.dart';
import 'package:canary_admin/ItemMenu.dart';
import 'package:flutter/material.dart';

class MenuHome extends StatefulWidget {

  final List<ItemMenu> itensMenus;
  final Function(int) positionSelected;

  const MenuHome({Key key, this.itensMenus, this.positionSelected}) : super(key: key);

  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {

  int positionSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0),
      width: 300,
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.black,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              _buildLine(),
              ... _createButtons()
            ],
          ),
        ),
      ),
    );
  }

  List<Widget>_createButtons() {
    int index = -1;
    return widget.itensMenus.map<Widget>((i){
      index++;
      return Padding(
        padding: EdgeInsets.only(top:10.0),
        child: ButtonMenu(
          index: index,
          text: i.text,
          icon: i.icon,
          selected: positionSelected == index,
          onPressed: (index){
            setState(() {
              if(widget.positionSelected != null){
                widget.positionSelected(index);
              }
              positionSelected = index;
            });
          },
        ),
      );
    }).toList();
  }

  _buildHeader() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Text("CanaryAdmin",
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
    );
  }

  _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      height: 1,
      color: Colors.grey.withAlpha(150),
    );
  }
}
