import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/domain/edit/editEmployeesController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/steps/dataTipo.dart';

class SetEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<EditEmployeeController>(
      builder: (_) {
        return Container(
          child: Column(
            children: [
              Text(
                'Personal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(),
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
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
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
                          decoration: InputDecoration(labelText: 'Código CMV'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    )
                  : SizedBox(height: 0),
              Center(
                child: btnSecondary(
                  text: 'Guardar',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
