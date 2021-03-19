import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';

import 'create/createWorkerPage.dart';
import 'show/showWorkerPage.dart';

class WorkersPageWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            flex: 2,
            child: VerAdmins(),
          ),
          Expanded(
            flex: 1,
            child: CreaAdmin(),
          ),
        ],
      ),
    );
  }
}
