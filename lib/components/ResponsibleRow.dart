
import 'package:flutter/material.dart';

class ResponsibleRow extends StatefulWidget {

  final List<Widget> children;
  final int maxItensRow;
  final double spaceBetween;
  final double widthToExpanded;
  const ResponsibleRow({
    Key key,
    this.children,
    this.maxItensRow,
    this.spaceBetween = 0.0,
    this.widthToExpanded = 400.0,
  }) : super(key: key);

  @override
  _ResponsibleRowState createState() => _ResponsibleRowState();
}

class _ResponsibleRowState extends State<ResponsibleRow> with TickerProviderStateMixin {

  double widthPerWidget = 0.0;
  List<Widget> rows = List();
  double opacity = 0.0;
  double initialWidth = 0.0;
  bool expandedMode = true;
  int sizeWidgets = 0;

  @override
  void initState() {
    sizeWidgets = widget.children.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,contrants){

        var currentWidth = contrants.maxWidth - ((sizeWidgets)*widget.spaceBetween);

        if(widthPerWidget == 0.0 || (currentWidth > initialWidth)) {
          initialWidth = contrants.maxWidth - ((sizeWidgets) * widget.spaceBetween);

          if(contrants.maxWidth <= widget.widthToExpanded){
            widthPerWidget = double.maxFinite;
            expandedMode = true;
            _initItens();
          }else {
            expandedMode = false;
            if(widget.maxItensRow == null){
              widthPerWidget = initialWidth/sizeWidgets;
            }else{
              widthPerWidget = initialWidth/widget.maxItensRow;
            }
            _initItens();
          }
        }

        if(contrants.maxWidth <= widget.widthToExpanded){
          widthPerWidget = double.maxFinite;
          if(!expandedMode) {
            expandedMode = true;
            _initItens();
          }
        }else{

          if(widget.maxItensRow == null){
            widthPerWidget = initialWidth/sizeWidgets;
          }else{
            widthPerWidget = initialWidth/widget.maxItensRow;
          }

          if (expandedMode){
            expandedMode = false;
            _initItens();
          }

        }

        return AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 300),
          child: _buildContext(context,contrants),
        );
      },
    );
    
  }

  void _initItens() {

    List<Widget> itens = List();
    widget.children.forEach((widget){
      itens.add(Container(
        width: widthPerWidget,
          child: widget
      ));
    });

    Future.delayed(Duration(milliseconds: 150),(){
      setState(() {
        rows = itens;
        opacity = 1.0;
      });
    });
  }

  Widget _buildContext(BuildContext context, BoxConstraints contrants) {
    return Wrap(
      spacing: widget.spaceBetween,
      runSpacing: widget.spaceBetween,
      children: rows,
    );
  }

}
