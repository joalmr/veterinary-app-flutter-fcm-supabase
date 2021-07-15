import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'vetList/vet_list_page.dart';

class StablishmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: VetList(),
    );
  }
}
