import 'package:canary_admin/ItemMenu.dart';
import 'package:canary_admin/MenuHome.dart';
import 'package:flutter/material.dart';

class BaseHome extends StatefulWidget {
  @override
  _BaseHomeState createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {

  List<ItemMenu> itens = List();

  @override
  void initState() {
    itens.add(ItemMenu("Dasboad",Icons.dashboard));
    itens.add(ItemMenu("User profile",Icons.person));
    itens.add(ItemMenu("Table List",Icons.content_paste));
    itens.add(ItemMenu("Tipography",Icons.description));
    itens.add(ItemMenu("Icons",Icons.insert_emoticon));
    itens.add(ItemMenu("Maps",Icons.map));
    itens.add(ItemMenu("Notifications",Icons.notifications));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          MenuHome(
            itensMenus: itens,
            primaryColor: Colors.blue,
            positionSelected: (position){
              // Aqui atualiza para mudar o content
            },
          ),
          Expanded(child: _buildContent())
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.transparent,
    );
  }
}
