import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'feedback/feedback_page.dart';
import 'statsData/stats_page.dart';

class StatsPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
