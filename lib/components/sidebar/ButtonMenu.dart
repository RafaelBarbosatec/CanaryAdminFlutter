import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {

  final int index;
  final String text;
  final IconData icon;
  final bool selected;
  final Color labelColorSelected;
  final Color labelColorUnSelected;
  final Color primaryColor;
  final FontWeight fontWeight;
  final Function(int) onPressed;
  final bool smallerMode;

  const ButtonMenu(
      {Key key,
      this.selected = false,
      this.labelColorSelected = Colors.white,
      this.labelColorUnSelected = Colors.grey,
      this.primaryColor = Colors.red,
      this.fontWeight = FontWeight.w400,
      this.text = "Text menu",
      this.icon = Icons.dashboard,
        this.onPressed, this.index,
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
        hoverColor: selected ? primaryColor : Colors.grey.withAlpha(30),
        color: selected ? primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: selected ? labelColorSelected : labelColorUnSelected,
            ),
            Expanded(child: _buildName(context))
          ],
        ),
        onPressed: (){
          if(onPressed != null && !selected){
            onPressed(index);
          }
        },
      ),
    );
  }

  Widget _buildName(BuildContext context) {

    if(smallerMode){
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
              color: selected ? labelColorSelected : labelColorUnSelected,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
