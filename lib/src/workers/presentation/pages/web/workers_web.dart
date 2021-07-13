import 'package:flutter/material.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'create/create_worker_page.dart';
import 'show/show_worker_page.dart';

class WorkersPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: VerAdmins(),
          ),
          Expanded(
            child: CreaAdmin(),
          ),
        ],
      ),
    );
  }
}
