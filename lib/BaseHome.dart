import 'package:canary_admin/Dimens.dart';
import 'package:canary_admin/components/sidebar/ItemMenu.dart';
import 'package:canary_admin/components/sidebar/MenuHome.dart';
import 'package:canary_admin/pages/Dashboard.dart';
import 'package:canary_admin/pages/Tipography.dart';
import 'package:canary_admin/pages/UserProfile.dart';
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
        color: Theme.of(context).backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MenuHome(
              itensMenus: itens,
              textColor: Colors.white,
              primaryColor: Theme.of(context).primaryColor,
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
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(right: Dimens.margin_default),
      children: <Widget>[
        _buildHeader(),
        AnimatedOpacity(
            opacity: opacityContent,
            duration: Duration(milliseconds: 300),
            child: AnimatedPadding(
                padding: EdgeInsets.only(top: opacityContent == 1.0 ? 0.0 : 20.0),
                child: contentWidget,
                duration: Duration(milliseconds: 300)
            )
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0,top: 20.0,left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AnimatedOpacity(
            opacity: opacityContent,
            duration: Duration(milliseconds: 300),
            child: Text(
                tittleContent,
              style: Theme.of(context).textTheme.title,
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

    Future.delayed(Duration(milliseconds: 300),(){
      setState(() {
        switch(position){
          case 0 : {
            tittleContent = "Dashboard";
            contentWidget = Dashboard();
          } break;
          case 3 :{
            tittleContent = "Tipography";
            contentWidget = Tipography();
          } break;
          default : {
            tittleContent = "Empty";
            contentWidget = UserProfile();
          }
        }

        opacityContent = 1.0;

      });

    });

  }

}
