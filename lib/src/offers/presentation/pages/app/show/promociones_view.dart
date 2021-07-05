import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/offers/data/model/offer_model.dart';
import 'package:vet_app/src/offers/domain/offers_controller.dart';

class PromocionesView extends StatelessWidget {
  const PromocionesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OffersController>(
      builder: (_) {
        return _.cargando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _.promociones.isEmpty
                ? const Center(
                    child: Text('No tienes promociones'),
                  )
                : ListView.builder(
                    itemCount: _.promociones.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String forDelete = _.promociones[index].id!;
                      final Offer promocion = _.promociones[index].offer!;
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tipo',
                                    style: TextStyle(color: colorMain),
                                  ),
                                  Text(
                                    promocion.serviceName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Creado',
                                    style: TextStyle(color: colorMain),
                                  ),
                                  Text(
                                    _.promociones[index].date.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    promocion.type == 'Amount'
                                        ? 'Monto de descuento'
                                        : promocion.type == 'Percentage'
                                            ? 'Porcentaje de descuento'
                                            : 'Precio promocional',
                                    style: const TextStyle(color: colorMain),
                                  ),
                                  Text(
                                    promocion.type == 'Amount'
                                        ? 'S/ -${promocion.discount}'
                                        : promocion.type == 'Percentage'
                                            ? '${promocion.discount}%'
                                            : 'S/ ${promocion.discount}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Descripción',
                                    style: TextStyle(color: colorMain),
                                  ),
                                  Text(
                                    promocion.description!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              btnAltern(
                                text: 'Eliminar',
                                color: colorRed,
                                bold: true,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
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
                                          onPressed: () => Get.back(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }
}
