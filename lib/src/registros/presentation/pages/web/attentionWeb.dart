import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

import 'filtros/filtersPage.dart';
import 'rowsShow/resgisteredPage.dart';

class AttentionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            child: Registered(),
          ),
          Container(
            width: 250,
            height: double.maxFinite,
            child: MiniStatAttention(),
          ),
        ],
      ),
    );
  }
}
