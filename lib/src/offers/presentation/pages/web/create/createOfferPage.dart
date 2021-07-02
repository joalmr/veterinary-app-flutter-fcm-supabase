import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/resources/utils/icons_map.dart';
import 'package:vet_app/src/establishments/data/model/serviceModel.dart';
import 'package:vet_app/src/offers/domain/create/createOfferController.dart';

class CreaOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateOfferController>(
      init: CreateOfferController(),
      builder: (_) {
        return Container(
          color: Color(0xffF7F7FF),
          child: 
          _.cargando
          ? Center(
              child: CircularProgressIndicator(),
            )
          : 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              subHeader(title: 'Nueva oferta'),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView(
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
                                    new Text(value.name!),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? val) {
                              _.serviceNum = val!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Descripción'),
                      controller: _.description,
                      textCapitalization: TextCapitalization.sentences,
                      maxLength: 150,
                      maxLines: 5,
                    ),
                    SizedBox(height: 15),
                    Text('Tipo'),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 0,
                      groupValue: _.selectValue,
                      onChanged: (int? val) => _.selectValue = val!,
                      title: Text('Monto de descuento'),
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 1,
                      groupValue: _.selectValue,
                      onChanged: (int? val) => _.selectValue = val!,
                      title: Text('Porcentaje de descuento'),
                    ),
                    RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: 2,
                      groupValue: _.selectValue,
                      onChanged: (int? val) => _.selectValue = val!,
                      title: Text('Precio promocional'),
                    ),
                    SizedBox(height: 15),
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
                          onPressed: () => _.create('web'),
                        ),
                      ),
                    ),
                    //
                    // Padding(
                    //   padding: EdgeInsets.only(top: 30),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: btnPrimary(
                    //       text: 'Crear',
                    //       onPressed: () {},
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    
  }
}
