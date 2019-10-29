import 'package:canary_admin/theme/AppTheme.dart';
import 'package:flutter/material.dart';

class CardContentTab extends StatelessWidget {
  final String title;
  final List<IconData> tabIcons;
  final List<String> tabTitles;

  const CardContentTab(this.tabTitles, {Key key, this.title, this.tabIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(title == null ? "" : title, style: textThemeMain.subtitle),
        Container(
          margin: EdgeInsets.only(left: 15),
          width: 600,
          child: _buildTabList(),
        )
      ],
    );
  }

  Widget _buildTabList() {
    return ListView.builder(
        itemCount: title.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: InkWell(
                  focusColor: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          tabIcons[index] == null ? "" : tabIcons[index],
                          color: Colors.white,
                        ),
                        Text(tabTitles[index])
                      ],

                  ),
                ),
              ),

          );
        });
  }
}
