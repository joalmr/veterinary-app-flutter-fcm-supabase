import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';
import 'dashboard/dashboardPage.dart';
import 'rigthComplement/unconfirmedPage.dart';

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
