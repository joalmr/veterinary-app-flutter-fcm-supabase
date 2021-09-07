import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';

class SaleDetail extends StatelessWidget {
  final String date;
  final String name;

  const SaleDetail({
    required this.date,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: name,
      body: Container(
        width: double.maxFinite,
        color: Colors.green,
        child: Column(
          children: [
            Text(date),
          ],
        ),
      ),
    );
  }
}
