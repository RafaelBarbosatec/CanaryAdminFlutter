import 'package:canary_admin/components/sidebar/ButtonMenu.dart';
import 'package:canary_admin/components/sidebar/ItemMenu.dart';
import 'package:flutter/material.dart';

class MenuHome extends StatefulWidget {
  final List<ItemMenu> itensMenus;
  final Function(int) positionSelected;
  final Color primaryColor;

  const MenuHome(
      {Key key,
        this.itensMenus,
        this.positionSelected,
        this.primaryColor = Colors.red})
      : super(key: key);

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
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset(
                  'assets/bg_sidebar.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.white.withAlpha(235),
              padding: EdgeInsets.all(10.0),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  _buildHeader(),
                  _buildLine(),
                  ..._createButtons()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createButtons() {
    int index = -1;
    return widget.itensMenus.map<Widget>((i) {
      index++;
      return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: ButtonMenu(
          index: index,
          text: i.text,
          icon: i.icon,
          primaryColor: widget.primaryColor,
          selected: positionSelected == index,
          onPressed: (index) {
            setState(() {
              if (widget.positionSelected != null) {
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
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "CanaryAdmin",
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      height: 1,
      color: Colors.grey.withAlpha(150),
    );
  }

  
}
