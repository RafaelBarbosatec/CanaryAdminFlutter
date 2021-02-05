import 'package:canary_admin/components/sidebar/item_menu.dart';
import 'package:canary_admin/components/sidebar/menu.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

typedef Widget ContentBuilder(int index);

class CanaryAdmin extends StatefulWidget {
  final List<CAItemMenu> itemMenuList;
  final List<Widget> actions;
  final ContentBuilder contentBuilder;
  final String title;
  final Color primaryColor;
  final Color menuTextColorSelected;
  final double widthMinToSmallMode;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  static Widget defaultTransitionBuilder(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 0.3), end: Offset(0, 0)).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  const CanaryAdmin({
    Key key,
    this.contentBuilder,
    this.itemMenuList,
    this.title,
    this.primaryColor = Colors.blue,
    this.actions,
    this.menuTextColorSelected = Colors.white,
    this.widthMinToSmallMode = 800,
    this.transitionBuilder = CanaryAdmin.defaultTransitionBuilder,
  }) : super(key: key);

  @override
  _CanaryAdminState createState() => _CanaryAdminState();
}

class _CanaryAdminState extends State<CanaryAdmin> {
  Widget _content = SizedBox.shrink();
  int _indexSelected = 0;

  @override
  void initState() {
    if (widget.itemMenuList.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 200), () {
        _positionMenuSelected(0);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CAMenu(
            title: widget.title,
            list: widget.itemMenuList,
            textColor: widget.menuTextColorSelected,
            primaryColor: widget.primaryColor,
            widthToSmall: widget.widthMinToSmallMode,
            positionSelected: _positionMenuSelected,
          ),
          Expanded(
            child: _buildContent(),
          )
        ],
      ),
    );
  }

  void _positionMenuSelected(int index) {
    _indexSelected = index;
    _content = widget.contentBuilder?.call(_indexSelected) ?? SizedBox.shrink();
    Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  Widget _buildContent() {
    return ListView(
      padding: EdgeInsets.only(right: Dimens.margin_default),
      children: <Widget>[
        _buildHeader(),
        SizedBox(
          height: 20,
        ),
        AnimatedSwitcher(
          transitionBuilder: widget.transitionBuilder,
          layoutBuilder: (Widget currentChild, List<Widget> previousChildren) {
            return Stack(
              children: <Widget>[
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
              alignment: Alignment.topCenter,
            );
          },
          duration: Duration(milliseconds: 300),
          child: _content,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 20.0, left: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            widget.itemMenuList[_indexSelected].text,
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(),
          ...(widget.actions ?? [])
        ],
      ),
    );
  }
}
