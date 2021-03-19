import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

import 'vetList/vetListPage.dart';

class StablishmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            child: VetList(),
          ),
        ],
      ),
    );
  }
}
