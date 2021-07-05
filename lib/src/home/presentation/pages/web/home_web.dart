import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';
import 'dashboard/dashboard_page.dart';
import 'rigthComplement/unconfirmed_page.dart';

class HomePageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            child: DashBoard(),
          ),
          Container(
            width: 300,
            height: double.maxFinite,
            child: Unconfirmed(),
          ),
        ],
      ),
    );
  }
}
