import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';
import 'package:vet_app/src/establishments/domain/edit/editEmployeesController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/steps/dataTipo.dart';

class SetEmployee extends StatelessWidget {
  final Employee employee;

  const SetEmployee({this.employee});

  @override
  Widget build(BuildContext context) {
    return GetX<EditEmployeeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo'),
                  Material(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: _.personalType,
                          items: personalTipo.map((ItemService value) {
                            return new DropdownMenuItem<String>(
                              value: value.id,
                              child: new Text(value.name),
                            );
                          }).toList(),
                          onChanged: (val) {
                            _.personalType = val;
                            print(_.personalType);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    initialValue: _.name.value,
                    onChanged: (val) => _.name.value = val,
                    decoration: InputDecoration(labelText: 'Nombre y apellido'),
                    textCapitalization: TextCapitalization.words,
                  ),
                  SizedBox(height: 15),
                  _.personalType == '2'
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              initialValue: _.code.value,
                              onChanged: (val) => _.code.value = val,
                              decoration:
                                  InputDecoration(labelText: 'Código CMV'),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        )
                      : SizedBox(height: 0),
                  SizedBox(height: 20),
                  Center(
                    child: btnSecondary(
                      text: _.isNew.value ? 'Agregar' : 'Guardar',
                      onPressed:
                          _.isNew.value ? _.addEmployee : _.updateEmployee,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
