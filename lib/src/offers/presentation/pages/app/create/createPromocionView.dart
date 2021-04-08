import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/recursos/utils/icons_map.dart';
import 'package:vet_app/src/establishments/data/model/serviceModel.dart';
import 'package:vet_app/src/offers/domain/create/createOfferController.dart';

class CreaPromocionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateOfferController>(
      init: CreateOfferController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crea promoción'),
          ),
          body: _.cargando
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  children: [
                    Text('Servicio'),
                    Material(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: _.serviceNum,
                            items: _.servicesVet.map((ServiceVetModel value) {
                              return new DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Row(
                                  children: [
                                    Icon(
                                      iconNum[value.id],
                                      size: 18,
                                    ),
                                    SizedBox(width: 10),
                                    new Text(value.name),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              _.serviceNum = val;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Descripción'),
                      controller: _.description,
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 150,
                      maxLines: 5,
                    ),
                    SizedBox(height: 10),
                    Text('Tipo'),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 0,
                      groupValue: _.selectValue,
                      onChanged: (val) => _.selectValue = val,
                      title: Text('Monto de descuento'),
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 1,
                      groupValue: _.selectValue,
                      onChanged: (val) => _.selectValue = val,
                      title: Text('Porcentaje de descuento'),
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 2,
                      groupValue: _.selectValue,
                      onChanged: (val) => _.selectValue = val,
                      title: Text('Precio promocional'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Monto'),
                      controller: _.moneyController,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: btnPrimary(
                          text: 'Crear',
                          onPressed: _.create,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
