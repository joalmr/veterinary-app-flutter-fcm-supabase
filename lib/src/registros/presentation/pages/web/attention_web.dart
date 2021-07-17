import 'package:flutter/material.dart';
import 'filtros/filters_page.dart';
import 'rowsShow/resgistered_page.dart';

class AttentionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Registered(),
        ),
        SizedBox(
          width: 250,
          height: double.maxFinite,
          child: MiniStatAttention(),
        ),
      ],
    );
  }
}
