import 'package:canary_admin/Dimens.dart';
import 'package:canary_admin/components/CardContent.dart';
import 'package:canary_admin/components/CardContentTab.dart';
import 'package:canary_admin/components/CardContentTitle.dart';
import 'package:canary_admin/components/CardInfoDashboard.dart';
import 'package:canary_admin/components/ResponsibleRow.dart';
import 'package:canary_admin/components/cardContentTab/ItemTab.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_buildHeader(), _buildChart(context)],
      ),
    );
  }

  _buildHeader() {
    return Wrap(
      spacing: 30.0, // gap between adjacent chips
      runSpacing: 35.0,
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
  }

  _buildChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ResponsibleRow(
        spaceBetween: Dimens.margin_default,
        children: <Widget>[
          CardContentTitle(
            title: "Employees Stats",
            subtitle: "New emplldksljdlksj ldskfjdslkfjds ",
            content: Text("Testando", style: Theme.of(context).textTheme.body1,),
          ),
          CardContentTab([
            ItemTab("BUGS", Icons.bug_report, Text("BUGS A LOT")),
            ItemTab("WEBSITE", Icons.chevron_left, Text("WEBSITES")),
            ItemTab("SERVER", Icons.cloud, Text("SERVERS"))
          ], title: "Tasksssssss")
        ],
      ),
    );
  }
}
