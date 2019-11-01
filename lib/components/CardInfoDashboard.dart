import 'package:canary_admin/Dimens.dart';
import 'package:flutter/material.dart';

class CardInfoDashboard extends StatelessWidget {

  final String title;
  final String information;
  final String bottomInformation;
  final IconData icon;
  final Color color;
  final IconData iconBottomInformation;

  const CardInfoDashboard({Key key, this.title, this.information, this.bottomInformation, this.icon, this.color, this.iconBottomInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_default)),
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: _buildContent()
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_default)),
            color: color,
            shadowColor: color,
            child: Container(
              width: 80,
              height: 80,
              child: Icon(iconBottomInformation,color: Colors.white,),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildValueInfo(),
        _buildLine(),
        _buildAditionalInfo()
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 1,
      color: Colors.grey.withAlpha(80),
    );
  }

  Widget _buildValueInfo() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 95.0,right: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[500]), maxLines: 1,),
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: Text(information, style: TextStyle(fontSize: 22.0), maxLines: 1,),
          ),
        ],
      ),
    );
  }

  _buildAditionalInfo() {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconBottomInformation, color: Colors.grey[500], size: 14,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(bottomInformation, style: TextStyle(color: Colors.grey[500], fontSize: 12), maxLines: 1,),
            ),
          )
        ],
      ),
    );
  }
}
