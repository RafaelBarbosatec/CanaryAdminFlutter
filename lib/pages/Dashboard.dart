import 'package:canary_admin/components/CardInfoDashboard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ListView(
        padding: EdgeInsets.all(0.0),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildHeader()
        ],
      ),
    );
  }

  _buildHeader() {
    return LayoutBuilder(
      builder: (context,size){
        return Wrap(
          spacing: 40.0, // gap between adjacent chips
          runSpacing: 20,
          children: <Widget>[
            CardInfoDashboard(
              color: Colors.orange,
              icon: Icons.content_copy,
              title: "Used Space",
              information: "49/50 GB",
              bottomInformation: "Get More Space...",
              iconBottomInformation: Icons.warning,
            ),
            CardInfoDashboard(
              color: Colors.green,
              icon: Icons.home,
              title: "Revenue",
              information: "\$34,245",
              bottomInformation: "Last 24 Hours.",
              iconBottomInformation: Icons.today,
            ),
            CardInfoDashboard(
              color: Colors.red,
              icon: Icons.home,
              title: "Fixed Issues",
              information: "75",
              bottomInformation: "Tracked from Github",
              iconBottomInformation: Icons.local_offer,
            ),
            CardInfoDashboard(
              color: Colors.lightBlue,
              icon: Icons.people,
              title: "Followers",
              information: "+245",
              bottomInformation: "Just Updated",
              iconBottomInformation: Icons.update,
            ),
          ],
        );
      },
    );
  }
}
