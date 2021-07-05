import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/resources/utils/icons_map.dart';
import 'package:vet_app/src/establishments/data/model/service_model.dart';
import 'package:vet_app/src/offers/domain/create/create_offer_controller.dart';

class CreaOferta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CreateOfferController>(
      init: CreateOfferController(),
      builder: (_) {
        return Container(
          color: const Color(0xffF7F7FF),
          child: _.cargando
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    subHeader(title: 'Nueva oferta'),
                    const SizedBox(height: 10.0),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        children: [
                          const Text('Servicio'),
                          Material(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: _.serviceNum,
                                  items: _.servicesVet
                                      .map((ServiceVetModel value) {
                                    return DropdownMenuItem<String>(
                                      value: value.id.toString(),
                                      child: Row(
                                        children: [
                                          Icon(
                                            iconNum[value.id],
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(value.name!),
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
                          const SizedBox(height: 15),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Descripción'),
                            controller: _.description,
                            textCapitalization: TextCapitalization.sentences,
                            maxLength: 150,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 15),
                          const Text('Tipo'),
                          RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 0,
                            groupValue: _.selectValue,
                            onChanged: (int? val) => _.selectValue = val!,
                            title: const Text('Monto de descuento'),
                          ),
                          RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 1,
                            groupValue: _.selectValue,
                            onChanged: (int? val) => _.selectValue = val!,
                            title: const Text('Porcentaje de descuento'),
                          ),
                          RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            value: 2,
                            groupValue: _.selectValue,
                            onChanged: (int? val) => _.selectValue = val!,
                            title: const Text('Precio promocional'),
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Monto'),
                            controller: _.moneyController,
                            keyboardType: TextInputType.number,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: SizedBox(
                              width: double.infinity,
                              child: btnPrimary(
                                text: 'Crear',
                                onPressed: () => _.create('web'),
                              ),
                            ),
                          ),
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
