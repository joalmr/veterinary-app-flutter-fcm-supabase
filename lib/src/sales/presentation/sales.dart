import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';

class SalesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        drawerActive: true,
        title: 'Ventas',
        body: ListView(
          children: [],
        ),
      ),
    );
  }
}
