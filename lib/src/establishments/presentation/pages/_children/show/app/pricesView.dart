import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import 'components/priceShow.dart';

class PricesView extends StatelessWidget {
  final Prices prices;
  const PricesView({Key key, @required this.prices}) : super(key: key);

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
                  "Precios",
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
                                'Editar precios',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Consulta'),
                              TextFormField(
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 5),
                              Text('Desparasitación'),
                              TextFormField(
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 5),
                              Text('Vacuna'),
                              TextFormField(
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 5),
                              Text('Grooming'),
                              TextFormField(
                                keyboardType: TextInputType.number,
                              ),
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
          Wrap(
            children: [
              precio(
                'Consulta',
                prices.consultation.from.toString(),
              ),
              precio(
                'Grooming',
                prices.grooming.from.toString(),
              ),
              precio(
                'Desparasitación',
                prices.deworming.from.toString(),
              ),
              precio(
                'Vacunas',
                prices.vaccination.from.toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
