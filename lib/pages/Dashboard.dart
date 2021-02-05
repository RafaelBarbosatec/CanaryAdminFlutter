import 'package:canary_admin/components/card_content_tab/Item_tab.dart';
import 'package:canary_admin/components/card_content_tab/card_content_tab.dart';
import 'package:canary_admin/components/card_content_title.dart';
import 'package:canary_admin/components/card_graph/card_graph.dart';
import 'package:canary_admin/components/card_info.dart';
import 'package:canary_admin/components/responsible_row.dart';
import 'package:canary_admin/shared/Dimens.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(),
          _buildChart(context),
          _buildContents(context),
        ],
      ),
    );
  }

  _buildHeader() {
    return CAResponsibleRow(
      spaceBetween: Dimens.margin_default,
      children: <Widget>[
        CACardInfo(
          color: Colors.orange,
          icon: Icons.content_copy,
          title: "Used Space",
          information: "49/50 GB",
          bottomInformation: "Get More Space...",
          iconBottomInformation: Icons.warning,
        ),
        CACardInfo(
          color: Colors.green,
          icon: Icons.home,
          title: "Revenue",
          information: "\$34,245",
          bottomInformation: "Last 24 Hours.",
          iconBottomInformation: Icons.today,
        ),
        CACardInfo(
          color: Colors.red,
          icon: Icons.home,
          title: "Fixed Issues",
          information: "75",
          bottomInformation: "Tracked from Github",
          iconBottomInformation: Icons.local_offer,
        ),
        CACardInfo(
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
      child: CAResponsibleRow(
        spaceBetween: Dimens.margin_default,
        children: <Widget>[
          CACardGraph(
            title: "Daily Sales",
            subTitle: "55% increase in today sales.",
            bottomText: "updated 4 minutes ago",
            color: Colors.green,
          ),
          CACardGraph(
            title: "Email Subscriptions",
            subTitle: "Last Campaign Performance",
            bottomText: "campaign sent 2 days ago",
            color: Colors.orange,
          ),
          CACardGraph(
            title: "Completed Tasks",
            subTitle: "Last Campaign Performance",
            bottomText: "campaign sent 2 days ago",
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  _buildContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.margin_default),
      child: CAResponsibleRow(
        spaceBetween: Dimens.margin_default,
        children: <Widget>[
          CACardContentTitle(
            title: "Employees Stats",
            subtitle: "New emplldksljdlksj ldskfjdslkfjds ",
            content: Container(
              height: 150.0,
            ),
            color: Colors.orange,
          ),
          CACardContentTab(
            [
              CAItemTab("BUGS", Icons.bug_report, Container(height: 150.0, child: Text("BUGS A LOT"))),
              CAItemTab("WEBSITE", Icons.chevron_left, Container(height: 150.0, child: Text("WEBSITES"))),
              CAItemTab("SERVER", Icons.cloud, Container(height: 150.0, child: Text("SERVERS")))
            ],
            title: "Tasks:",
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}
