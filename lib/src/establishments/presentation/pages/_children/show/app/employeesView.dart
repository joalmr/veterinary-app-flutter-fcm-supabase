import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import 'components/employeeShow.dart';

class EmployeesView extends StatelessWidget {
  final List<Employee> employees;
  const EmployeesView({Key key, @required this.employees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 10.0,
              right: 0.0,
              bottom: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Empleados",
                  style: Get.textTheme.subtitle2.apply(fontWeightDelta: 2),
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 18,
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Editar empleados',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              SizedBox(height: 15),
                              Center(
                                child: btnSecondary(
                                  text: 'Guardar',
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(height: 15),
                              Center(
                                child: btnAltern(
                                  text: 'Volver',
                                  onPressed: () => Get.back(),
                                  bold: true,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: employees
                  .map(
                    (e) => employee(
                      type: e.typeId,
                      name: e.name,
                      code: e.code,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
