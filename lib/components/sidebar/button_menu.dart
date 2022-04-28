import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CAButtonMenu extends StatelessWidget {
  final int index;
  final String text;
  final IconData icon;
  final bool selected;
  final Color textColor;
  final Color primaryColor;
  final FontWeight fontWeight;
  final ValueChanged<int>? onPressed;
  final bool smallerMode;

  const CAButtonMenu(
      {Key? key,
      this.selected = false,
      this.textColor = Colors.white,
      this.primaryColor = Colors.blue,
      this.fontWeight = FontWeight.w400,
      this.text = "Text menu",
      this.icon = Icons.dashboard,
      this.onPressed,
      required this.index,
      this.smallerMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50.0,
      child: RaisedButton(
        animationDuration: Duration(microseconds: 200),
        highlightElevation: selected ? 5 : 0,
        elevation: selected ? 3 : 0,
        hoverElevation: selected ? 3 : 0,
        hoverColor: selected ? primaryColor : Theme.of(context).hoverColor,
        color: selected ? primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.radius_default)),
        ),
        child: Row(
          children: <Widget>[
            if (smallerMode) Spacer(),
            Icon(
              icon,
              color: selected
                  ? textColor
                  : Theme.of(context).unselectedWidgetColor,
            ),
            if (smallerMode) Spacer(),
            if (!smallerMode) Expanded(child: _buildName(context))
          ],
        ),
        onPressed: () {
          if (onPressed != null && !selected) {
            onPressed?.call(index);
          }
        },
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        child: Text(
          text,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyText2?.merge(
                TextStyle(
                  color: selected
                      ? textColor
                      : Theme.of(context).unselectedWidgetColor,
                  fontFamily: selected ? 'normal' : 'Light',
                ),
              ),
        ),
      ),
    );
  }
}
