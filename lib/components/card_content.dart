import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CACardContent extends StatefulWidget {
  final Color color;
  final Widget? header;
  final Widget? content;

  const CACardContent(
      {Key? key, this.color = Colors.white, this.header, this.content})
      : super(key: key);

  @override
  _CACardContentState createState() => _CACardContentState();
}

class _CACardContentState extends State<CACardContent> {
  GlobalKey _keyHeader = GlobalKey();

  double paddingTop = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimens.margin_default),
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: Dimens.margin_default),
          child: Material(
            borderRadius:
                BorderRadius.all(Radius.circular(Dimens.radius_default)),
            elevation: 0.5,
            child: Container(
              padding: EdgeInsets.only(
                  top: paddingTop,
                  left: Dimens.margin_default,
                  right: Dimens.margin_default,
                  bottom: Dimens.margin_default),
              width: double.maxFinite,
              child: widget.content,
            ),
          ),
        ),
        Container(
          key: _keyHeader,
          margin: const EdgeInsets.only(left: 15.0, right: 15),
          child: Material(
            elevation: 4,
            borderRadius:
                BorderRadius.all(Radius.circular(Dimens.radius_default)),
            color: widget.color,
            shadowColor: widget.color,
            child: Container(
              padding: EdgeInsets.all(Dimens.margin_header),
              width: double.maxFinite,
              child: widget.header,
            ),
          ),
        )
      ]),
    );
  }

  void _afterLayout(Duration timeStamp) {
    final RenderBox? renderBoxRed =
        _keyHeader.currentContext?.findRenderObject() as RenderBox;
    final sizeRed = renderBoxRed?.size;
    if (sizeRed != null) {
      setState(() {
        paddingTop = sizeRed.height;
      });
    }
  }
}
