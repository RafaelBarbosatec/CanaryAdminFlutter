import 'package:canary_admin/components/card_content_tab/Item_tab.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class CAItemTabWidget extends StatelessWidget {
  final int id;
  final CAItemTab item;
  final bool isSelected;
  final Function(int) onTab;

  const CAItemTabWidget({Key key, this.item, this.id, this.onTab, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.radius_default)),
        color: isSelected ? Colors.white.withAlpha(50) : Colors.transparent,
        child: InkWell(
          onTap: () {
            if (onTab != null) {
              onTab(id);
            }
          },
          focusColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  item.icon == null ? "" : item.icon,
                  color: Colors.white,
                ),
                Container(
                  child: Text(
                    item.text,
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),
                  ),
                  margin: EdgeInsets.only(left: 8, right: 8),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
