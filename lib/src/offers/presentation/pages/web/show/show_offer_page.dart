import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/child_region.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/offers/data/model/offer_model.dart';
import 'package:vet_app/src/offers/domain/offers_controller.dart';

class VerOfertas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<OffersController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
              child: const Text(
                'Promociones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: _.cargando
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _.promociones.isEmpty
                      ? const Center(
                          child: Text('No tienes promociones'),
                        )
                      : ListView.builder(
                          itemCount: _.promociones.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemBuilder: (BuildContext context, int index) {
                            final String forDelete = _.promociones[index].id!;
                            final Offer promocion = _.promociones[index].offer!;
                            return ChildRegion(
                              margin: const EdgeInsets.all(10),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              text: 'Creado: ',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: _
                                                      .promociones[index].date
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: 'Tipo: ',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: promocion.serviceName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text: promocion.type == 'Amount'
                                                  ? 'Monto de descuento'
                                                  : promocion.type ==
                                                          'Percentage'
                                                      ? '''Porcentaje de descuento'''
                                                      : 'Precio promocional',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: promocion.type ==
                                                          'Amount'
                                                      ? ' S/ -${promocion.discount}'
                                                      : promocion.type ==
                                                              'Percentage'
                                                          ? ''' ${promocion.discount}%'''
                                                          : ' S/ ${promocion.discount}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text('Eliminar'),
                                                  content: const Text(
                                                      '''Seguro que desea eliminar la promoción?'''),
                                                  actions: <Widget>[
                                                    btnAltern(
                                                      text: 'Sí, eliminar',
                                                      bold: true,
                                                      color: colorRed,
                                                      onPressed: () {
                                                        _.delete(forDelete);
                                                        Get.back();
                                                      },
                                                    ),
                                                    btnAltern(
                                                      text: 'Cancelar',
                                                      bold: true,
                                                      onPressed: () =>
                                                          Get.back(),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: 38.0,
                                              width: 38.0,
                                              decoration: BoxDecoration(
                                                color: colorRed,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: const Icon(
                                                Icons.delete_forever_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Descripción'),
                                            Text(
                                              promocion.description!,
                                              maxLines: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        );
      },
    );
  }
}
