import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigationBar.dart';
import 'package:vet_app/src/establishments/view/_children/create/web/addVet.dart';

class CreaVetPage extends StatelessWidget {
  const CreaVetPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationBar(),
          Expanded(
            child: AddVet(),
          ),
        ],
      ),
    );
  }
}
