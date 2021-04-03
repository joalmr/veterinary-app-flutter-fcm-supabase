import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

import 'create/createOfferPage.dart';
import 'show/showOfferPage.dart';

class OffersPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            flex: 4,
            child: VerOfertas(),
          ),
          Expanded(
            flex: 1,
            child: CreaOferta(),
          ),
        ],
      ),
    );
  }
}
