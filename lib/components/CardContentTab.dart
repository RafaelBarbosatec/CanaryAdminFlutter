import 'package:canary_admin/Dimens.dart';
import 'package:canary_admin/components/CardContent.dart';
import 'package:canary_admin/components/cardContentTab/ItemTab.dart';
import 'package:flutter/material.dart';

class CardContentTab extends StatefulWidget {
  final String title;
  final List<ItemTab> tabs;


  CardContentTab( this.tabs, {Key key, this.title})
      : super(key: key);

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
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(margin: EdgeInsets.only(right: Dimens.margin_default),child: Text("fdfsdfdsfdsf dfds ")),
          _buildTabList(),
        ],
      ),
    );
  }

  Widget _buildTabList() {
    return ListView.builder(
        itemCount: widget.tabs.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(0.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_default)),
              color: Colors.transparent,
              child: InkWell(

                onTap: (){
                  setState(() {
                    itemSelected = index;
                  });
                },
                focusColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        widget.tabs[index].icon == null ? "" : widget.tabs[index].icon,
                        color: Colors.white,
                      ),
                      Container(child: Text(widget.tabs[index].text), margin: EdgeInsets.only(left: 8, right: 8),)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
