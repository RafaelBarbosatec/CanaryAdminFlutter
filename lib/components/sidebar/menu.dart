import 'package:canary_admin/components/sidebar/button_menu.dart';
import 'package:canary_admin/components/sidebar/item_menu.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CAMenu extends StatefulWidget {
  final List<CAItemMenu> list;
  final ValueChanged<int>? positionSelected;
  final Color primaryColor;
  final Color textColor;
  final double widthToSmall;
  final String title;

  const CAMenu({
    Key? key,
    this.list = const [],
    this.positionSelected,
    this.primaryColor = Colors.red,
    this.textColor = Colors.white,
    this.widthToSmall = 800,
    this.title = 'Title',
  }) : super(key: key);

  @override
  _CAMenuState createState() => _CAMenuState();
}

class _CAMenuState extends State<CAMenu> {
  int positionSelected = 0;
  bool smallerMode = false;

  static const double WIDTH_NORMAL = 300;
  static const double WIDTH_SMALLER = 98;
  static const double ELEVATION_SIDEBAR = 4.0;

  @override
  Widget build(BuildContext context) {
    smallerMode = MediaQuery.of(context).size.width < widget.widthToSmall;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(right: Dimens.margin_default),
      width: smallerMode ? WIDTH_SMALLER : WIDTH_NORMAL,
      child: Material(
        elevation: ELEVATION_SIDEBAR,
        shadowColor: Colors.black,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                color: Theme.of(context).backgroundColor,
                width: double.maxFinite,
                height: double.maxFinite,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/bg_sidebar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                padding: EdgeInsets.all(0.0),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  _buildHeader(),
                  _buildLine(),
                  ..._createButtons(),
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
    return widget.list.map<Widget>((i) {
      index++;
      return Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: CAButtonMenu(
          index: index,
          text: i.text,
          icon: i.icon,
          textColor: widget.textColor,
          smallerMode: smallerMode,
          primaryColor: widget.primaryColor,
          selected: positionSelected == index,
          onPressed: (index) {
            setState(() {
              widget.positionSelected?.call(index);
              positionSelected = index;
              smallerMode = !smallerMode;
            });
          },
        ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    if (smallerMode) {
      return SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.title,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      height: 1,
      color: smallerMode ? Colors.transparent : Colors.grey.withAlpha(150),
    );
  }
}
