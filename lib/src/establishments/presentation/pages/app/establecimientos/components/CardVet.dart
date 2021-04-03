import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/establishmentsController.dart';

class CardEstablecimiento extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String ruc;
  final int aprobado;
  final int tipo;

  const CardEstablecimiento(
      {Key key,
      @required this.id,
      @required this.image,
      @required this.name,
      @required this.ruc,
      @required this.aprobado,
      @required this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return InkWell(
          onTap: () => _.go2Show(id),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          height: 82.0,
                          width: 82.0,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(height: 5),
                          Text(
                            ruc,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                aprobado == 1
                                    ? Icons.check_box_rounded
                                    : Icons.indeterminate_check_box_rounded,
                                size: 14,
                              ),
                              SizedBox(width: 10),
                              Text(
                                aprobado == 1 ? 'Aprobado' : 'En espera',
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.home_work_rounded,
                                size: 14,
                              ),
                              SizedBox(width: 10),
                              Text(
                                tipo == 1 ? 'Veterinaria' : 'Grooming',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: btnAltern(
                        text: 'Eliminar',
                        color: colorRed,
                        bold: true,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Eliminar'),
                              content: Text(
                                  'Seguro que desea eliminar el establecimiento?'),
                              actions: <Widget>[
                                btnAltern(
                                  text: 'Sí, eliminar',
                                  bold: true,
                                  color: colorRed,
                                  onPressed: () {
                                    _.deldete(id);
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
                          // Get.dialog(
                          // );
                        }),
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
