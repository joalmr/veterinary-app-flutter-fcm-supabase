import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';

import 'feedback/feedback_page.dart';
import 'statsData/stats_page.dart';

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
          SizedBox(
            width: 350,
            height: double.maxFinite,
            child: FeedbackContent(),
          ),
        ],
      ),
    );
  }
}
