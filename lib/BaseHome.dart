import 'package:canary_admin/components/sidebar/ItemMenu.dart';
import 'package:canary_admin/components/sidebar/MenuHome.dart';
import 'package:canary_admin/pages/Dashboard.dart';
import 'package:flutter/material.dart';

class BaseHome extends StatefulWidget {
  @override
  _BaseHomeState createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {

  List<ItemMenu> itens = List();

  String tittleContent = "Dashboard";
  Widget contentWidget = Dashboard();
  double opacityContent = 1.0;

  @override
  void initState() {
    itens.add(ItemMenu("Dashboard",Icons.dashboard));
    itens.add(ItemMenu("User profile",Icons.person));
    itens.add(ItemMenu("Table List",Icons.content_paste));
    itens.add(ItemMenu("Tipography",Icons.description));
    itens.add(ItemMenu("Icons",Icons.bubble_chart));
    itens.add(ItemMenu("Maps",Icons.map));
    itens.add(ItemMenu("Notifications",Icons.notifications));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MenuHome(
              itensMenus: itens,
              primaryColor: Colors.blue,
              positionSelected: (position){
                _confContent(position);
              },
            ),
            Expanded(child: _buildContent())
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.only(left: 10.0,right: 20.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          _buildHeader(),
          AnimatedOpacity(
              opacity: opacityContent,
              duration: Duration(milliseconds: 300),
              child: contentWidget
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0,top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
              tittleContent,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
              fontWeight: FontWeight.w400
            ),
          ),
          _buildRighthealder()
        ],
      ),
    );
  }

  Widget _buildRighthealder() {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: (){})
        ],
      ),
    );
  }

  void _confContent(int position) {

    setState(() {
      opacityContent = 0.0;
    });

    Future.delayed(Duration(milliseconds: 200),(){
      setState(() {
        switch(position){
          case 0 : {
            tittleContent = "Dashboard";
            contentWidget = Dashboard();
          } break;
          default : {
            tittleContent = "Empty";
            contentWidget = Container();
          }
        }

        opacityContent = 1.0;

      });

    });

  }

}
