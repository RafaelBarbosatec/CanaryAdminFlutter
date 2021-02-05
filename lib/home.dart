import 'package:canary_admin/components/canary_admin.dart';
import 'package:canary_admin/components/sidebar/item_menu.dart';
import 'package:canary_admin/pages/Dashboard.dart';
import 'package:canary_admin/pages/Tipography.dart';
import 'package:canary_admin/pages/UserProfile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CanaryAdmin(
      itemMenuList: [
        CAItemMenu("Dashboard", Icons.dashboard),
        CAItemMenu("User profile", Icons.person),
        CAItemMenu("Table List", Icons.content_paste),
        CAItemMenu("Tipography", Icons.description),
        CAItemMenu("Icons", Icons.bubble_chart),
        CAItemMenu("Maps", Icons.map),
        CAItemMenu("Notifications", Icons.notifications)
      ],
      contentBuilder: (index) {
        return _getContent(index);
      },
      title: 'CanaryAdmin',
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _getContent(int position) {
    switch (position) {
      case 0:
        return Dashboard();
        break;
      case 3:
        return Tipography();
        break;
      default:
        return UserProfile();
    }
  }
}
