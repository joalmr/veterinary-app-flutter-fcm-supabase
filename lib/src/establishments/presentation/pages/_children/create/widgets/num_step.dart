import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/create_vet_controller.dart';

class NumStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: colorGreen,
          ),
          child: Center(
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[100]),
              child: Center(
                child: Text(
                  '${_.selected} / 4',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
