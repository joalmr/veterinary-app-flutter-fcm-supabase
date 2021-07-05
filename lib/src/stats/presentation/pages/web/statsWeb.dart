import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

import 'feedback/feedbackPage.dart';
import 'statsData/statsPage.dart';

class StatsPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          const Expanded(
            child: StatsData(),
          ),
          Container(
            width: 350,
            height: double.maxFinite,
            child: FeedbackContent(),
          ),
        ],
      ),
    );
  }
}
