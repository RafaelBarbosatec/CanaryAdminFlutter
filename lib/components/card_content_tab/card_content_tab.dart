import 'package:canary_admin/components/card_content.dart';
import 'package:canary_admin/components/card_content_tab/Item_tab.dart';
import 'package:canary_admin/components/card_content_tab/Item_tab_widget.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CACardContentTab extends StatefulWidget {
  static const HEIGHT_TAB_BAR = 50.0;
  final String title;
  final List<CAItemTab> tabs;
  final Color? color;
  final double heightTabBar;

  CACardContentTab(this.tabs,
      {Key? key,
      required this.title,
      this.color,
      this.heightTabBar = HEIGHT_TAB_BAR})
      : super(key: key);

  @override
  _CACardContentTabState createState() => _CACardContentTabState();
}

class _CACardContentTabState extends State<CACardContentTab> {
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return CACardContent(
      header: _buildHeader(context),
      content: widget.tabs[_indexSelected].content,
      color: widget.color ?? Theme.of(context).primaryColor,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: widget.heightTabBar,
      width: double.maxFinite,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: Dimens.margin_default),
              child: Center(
                  child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.merge(TextStyle(color: Colors.white)),
              ))),
          ..._buildTabList(),
        ],
      ),
    );
  }

  List<Widget> _buildTabList() {
    int index = -1;
    var list = widget.tabs.map<Widget>((item) {
      index++;
      return CAItemTabWidget(
        id: index,
        item: item,
        isSelected: index == _indexSelected,
        onTab: (id) {
          setState(() {
            _indexSelected = id;
          });
        },
      );
    }).toList();

    return list;
  }
}
