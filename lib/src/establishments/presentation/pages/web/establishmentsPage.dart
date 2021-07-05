import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';

import 'vetList/vetListPage.dart';

class StablishmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          NavigationBar(),
          Expanded(
            child: VetList(),
          ),
        ],
      ),
    );
  }
}
