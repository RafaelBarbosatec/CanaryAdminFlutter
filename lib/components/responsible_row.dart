import 'package:flutter/material.dart';

class CAResponsibleRow extends StatefulWidget {
  final List<Widget> children;
  final int? maxCount;
  final double spaceBetween;
  final double widthToExpanded;
  const CAResponsibleRow({
    Key? key,
    required this.children,
    this.maxCount,
    this.spaceBetween = 0.0,
    this.widthToExpanded = 500.0,
  }) : super(key: key);

  @override
  _CAResponsibleRowState createState() => _CAResponsibleRowState();
}

class _CAResponsibleRowState extends State<CAResponsibleRow>
    with TickerProviderStateMixin {
  double widthPerWidget = 0.0;
  List<Widget> rows = [];
  double initialWidth = 0.0;
  bool expandedMode = true;
  int countWidgets = 0;

  @override
  void initState() {
    countWidgets = widget.children.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var currentWidth =
            constraints.maxWidth - (countWidgets * widget.spaceBetween);

        if (widthPerWidget == 0.0 || (currentWidth > initialWidth)) {
          initialWidth =
              constraints.maxWidth - (countWidgets * widget.spaceBetween);

          if (constraints.maxWidth <= widget.widthToExpanded) {
            widthPerWidget = double.maxFinite;
            expandedMode = true;
            _initWidgets();
          } else {
            expandedMode = false;
            if (widget.maxCount == null) {
              widthPerWidget = initialWidth / countWidgets;
            } else {
              widthPerWidget = initialWidth / widget.maxCount!;
            }
            _initWidgets();
          }
        }

        if (constraints.maxWidth <= widget.widthToExpanded) {
          widthPerWidget = double.maxFinite;
          if (!expandedMode) {
            expandedMode = true;
            _initWidgets();
          }
        } else {
          if (widget.maxCount == null) {
            widthPerWidget = initialWidth / countWidgets;
          } else {
            widthPerWidget = initialWidth / widget.maxCount!;
          }

          if (expandedMode) {
            expandedMode = false;
            _initWidgets();
          }
        }

        return Wrap(
          spacing: widget.spaceBetween,
          runSpacing: widget.spaceBetween,
          children: rows,
        );
      },
    );
  }

  void _initWidgets() {
    List<Widget> widgets = [];
    widget.children.forEach((widget) {
      widgets.add(SizedBox(width: widthPerWidget, child: widget));
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        rows = widgets;
      });
    });
  }
}
