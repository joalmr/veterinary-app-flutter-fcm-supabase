import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navigation_bar.dart';

import 'filtros/filters_page.dart';
import 'rowsShow/resgistered_page.dart';

class AttentionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            child: Registered(),
          ),
          SizedBox(
            width: 250,
            height: double.maxFinite,
            child: MiniStatAttention(),
          ),
        ],
      ),
    );
  }
}
