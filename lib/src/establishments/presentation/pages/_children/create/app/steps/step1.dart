import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/widgets/dataTipo.dart';



class Step1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateVetController>(
      builder: (_) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                controller: _.v.nameVet,
                onChanged: (val) => _.entity.name = val,
                textCapitalization: TextCapitalization.sentences,
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(labelText: 'Teléfono'),
                controller: _.v.phoneVet,
                onChanged: (val) => _.entity.phone = val,
                keyboardType: TextInputType.number,
                inputFormatters: [TextInputMask(mask: '999-999-999')],
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(labelText: 'RUC'),
                controller: _.v.rucVet,
                onChanged: (val) => _.entity.ruc = val,
                keyboardType: TextInputType.number,
                inputFormatters: [TextInputMask(mask: '99999999999')],
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(labelText: 'Web o red social'),
                controller: _.v.webVet,
                onChanged: (val) => _.entity.website = val,
              ),
              SizedBox(height: 15),
              Text('Tipo'),
              Material(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value: _.vetType,
                      items: itemTipo.map((ItemService value) {
                        return new DropdownMenuItem<String>(
                          value: value.id,
                          child: new Text(value.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        print(val);
                        _.vetType = val;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text('Servicios'),
              Wrap(
                children: _.servicesVet
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: TextButton(
                          child: Text(item.name),
                          onPressed: () => _.add2List(item.id),
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 0.5, horizontal: 5.0),
                            alignment: Alignment.center,
                            backgroundColor: _.servicesVetSet.contains(item.id)
                                ? colorGreen
                                : Colors.transparent,
                            primary: _.servicesVetSet.contains(item.id)
                                ? Colors.white
                                : colorGreen,
                            side: BorderSide(color: colorGreen),
                          ),
                        ),
                      ),
                    )
                    .toList()
                    .cast<Widget>(),
              ),
              SizedBox(height: 5),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
