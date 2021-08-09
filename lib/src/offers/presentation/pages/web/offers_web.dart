import 'package:flutter/material.dart';
import 'create/create_offer_page.dart';
import 'show/show_offer_page.dart';

class OffersPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: VerOfertas(),
        ),
        Expanded(
          child: CreaOferta(),
        ),
      ],
    );
  }
}
