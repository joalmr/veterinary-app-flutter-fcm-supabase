import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';
import 'package:vet_app/src/offers/domain/offersController.dart';

class VerOfertas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<OffersController>(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
              child: Text(
                'Promociones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: 
              _.cargando
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _.promociones.length == 0
                ? Center(
                    child: Text('No tienes promociones'),
                  )
                : 
              ListView.builder(
                itemCount: _.promociones.length,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemBuilder: (BuildContext context, int index) {
                  String forDelete = _.promociones[index].id;
                  Offer promocion = _.promociones[index].offer;
                  return ChildRegion(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  promocion.serviceName,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: 'Creado: ',
                                    style: TextStyle(fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: _.promociones[index].date.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: Text(
                              promocion.description,
                              maxLines: 10,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              promocion.type == 'Amount'
                                ? 'Monto de descuento'
                                : promocion.type == 'Percentage'
                                    ? 'Porcentaje de descuento'
                                    : 'Precio promocional',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              promocion.type == 'Amount'
                                ? 'S/ -${promocion.discount}'
                                : promocion.type == 'Percentage'
                                    ? '${promocion.discount}%'
                                    : 'S/ ${promocion.discount}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              height: 38.0,
                              width: 38.0,
                              decoration: BoxDecoration(
                                color: colorRed,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Icon(
                                Icons.delete_forever_rounded,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Eliminar'),
                                  content: Text(
                                      'Seguro que desea eliminar la promoción?'),
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
              ),
            ),
          ],
        );
      },
    );
    
  }
}
