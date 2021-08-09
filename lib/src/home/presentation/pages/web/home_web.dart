import 'package:flutter/material.dart';
import 'dashboard/dashboard_page.dart';
import 'rigthComplement/unconfirmed_page.dart';

class HomePageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DashBoard(),
        ),
        SizedBox(
          width: 300,
          height: double.maxFinite,
          child: Unconfirmed(),
        )
      ],
    );
  }
}
