import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/src/establishments/domain/edit/editEmployeesController.dart';

import 'setEmployee.dart';

class EditEmployeesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<EditEmployeeController>(
      init: EditEmployeeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Editar empleados'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add_rounded),
            onPressed: () {
              Get.to(SetEmployee());
            },
          ),
          body: ListView.builder(
            itemCount: _.employees.length,
            itemBuilder: (BuildContext context, int index) {
              var employee = _.employees[index];
              return Container(
                margin: EdgeInsets.only(bottom: 5, left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              employee.typeId == 1 ? colorBlue : colorGreen,
                          child: Icon(
                            employee.typeId == 1
                                ? IconProypet.grooming
                                : IconProypet.consulta,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        SizedBox(width: 7.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              employee.typeId == 1
                                  ? 'Groomer'
                                  : 'Veterinario/a',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: employee.typeId == 1
                                    ? colorBlue
                                    : colorGreen,
                                decorationThickness: 2,
                              ),
                            ),
                            Text('${employee.name}'),
                            employee.code != null
                                ? Text('${employee.code}')
                                : SizedBox(height: 0),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(
                            Icons.delete,
                            color: colorRed,
                          ),
                          onPressed: () {
                            _.employees.length <= 1
                                ? Get.snackbar(
                                    'Advertencia',
                                    'No puede ser eliminado, debe tener al menos un empleado',
                                    backgroundColor: colorYellow,
                                  )
                                : showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Eliminar'),
                                      content: Text(
                                          'Seguro que desea eliminar al empleado?'),
                                      actions: <Widget>[
                                        btnAltern(
                                          text: 'Sí, eliminar',
                                          bold: true,
                                          color: colorRed,
                                          onPressed: () {
                                            _.deleteEmployee(employee.id);
                                            Get.back();
                                          },
                                        ),
                                        btnAltern(
                                          text: 'Cancelar',
                                          bold: true,
                                          onPressed: () => Get.back(),
                                        ),
                                      ],
                                    ),
                                  );
                          },
                        ),
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(
                            Icons.edit,
                            color: colorBlue,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
