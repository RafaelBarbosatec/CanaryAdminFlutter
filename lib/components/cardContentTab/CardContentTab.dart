import 'package:canary_admin/Dimens.dart';
import 'package:canary_admin/components/CardContent.dart';
import 'package:canary_admin/components/cardContentTab/ItemTab.dart';
import 'package:canary_admin/components/cardContentTab/ItemTabWidget.dart';
import 'package:flutter/material.dart';

class CardContentTab extends StatefulWidget {

  final String title;
  final List<ItemTab> tabs;
  final Color color;

  CardContentTab(this.tabs, {Key key, this.title, this.color}) : super(key: key);

  @override
  _CardContentTabState createState() => _CardContentTabState();
}

class _CardContentTabState extends State<CardContentTab> {
  int itemSelected;

  @override
  void initState() {
    super.initState();
    itemSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return CardContent(
      header: _buildHeader(context),
      content: widget.tabs[itemSelected].content,
      color: widget.color == null ? Theme.of(context).primaryColor: widget.color,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: Dimens.margin_default),
              child: Center(
                  child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .merge(TextStyle(color: Colors.white)),
              ))),
          ..._buildTabList(),
        ],
      ),
    );
  }

  List<Widget> _buildTabList() {
    int index = -1;
    print(itemSelected);
    var list = widget.tabs.map<Widget>((item) {
      index++;
     return ItemTabWidget(
       id: index,
       item: item,
       isSelected: index == itemSelected,
       onTab: (id){
         setState(() {
           itemSelected = id;
         });
       },
     );
    }).toList();

    return list;
  }
}
