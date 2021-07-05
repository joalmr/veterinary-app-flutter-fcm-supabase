import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';

import 'create/create_offer_page.dart';
import 'show/show_offer_page.dart';

class OffersPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            flex: 2,
            child: VerOfertas(),
          ),
          Expanded(
            child: CreaOferta(),
          ),
        ],
      ),
    );
  }
}
