
import 'package:flutter/material.dart';

class ResponsibleRow extends StatefulWidget {

  final List<Widget> children;
  final int maxItensRow;
  final double spaceBetween;
  const ResponsibleRow({
    Key key,
    this.children,
    this.maxItensRow,
    this.spaceBetween = 0.0,
  }) : super(key: key);

  @override
  _ResponsibleRowState createState() => _ResponsibleRowState();
}

class _ResponsibleRowState extends State<ResponsibleRow> with TickerProviderStateMixin {

  double widthPerWidget = 0.0;
  List<Widget> rows = List();
  double opacity = 0.0;
  double initialWidth = 0.0;

  bool columnMode = false;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,contrants){

        if(widthPerWidget == 0.0 || (contrants.maxWidth > initialWidth && !columnMode)){

          int size = widget.children.length;

          initialWidth = contrants.maxWidth - ((size-1)*widget.spaceBetween);
          if(widget.maxItensRow == null){
            widthPerWidget = initialWidth/size;
          }else{
            widthPerWidget = initialWidth/widget.maxItensRow;
          }

          _initItens();
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
