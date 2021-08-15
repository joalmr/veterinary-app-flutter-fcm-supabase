import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/establishments_controller.dart';

class CardEstablecimiento extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String ruc;
  final int aprobado;
  final int tipo;

  const CardEstablecimiento(
      {Key? key,
      required this.id,
      required this.image,
      required this.name,
      required this.ruc,
      required this.aprobado,
      required this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstablishmentsController>(
      builder: (_) {
        return InkWell(
          onTap: () => _.go2Show(id),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ruc,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                aprobado == 1
                                    ? Icons.check_box_rounded
                                    : Icons.indeterminate_check_box_rounded,
                                size: 14,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                aprobado == 1 ? 'Aprobado' : 'En espera',
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(
                                Icons.home_work_rounded,
                                size: 14,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                tipo == 1 ? 'Veterinaria' : 'Grooming',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  '''Seguro que desea eliminar el establecimiento?'''),
                              actions: <Widget>[
                                btnAltern(
                                  text: 'Sí, eliminar',
                                  bold: true,
                                  color: colorRed,
                                  onPressed: () {
                                    _.delete(id);
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
                      IconButton(
                        icon: Icon(
                          Icons.star_rounded,
                          color: prefUser.vetId == id ? colorMain : null,
                          size: 32,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Establecimiento'),
                              content: const Text(
                                  '''Seguro que desea cambiar de establecimiento?'''),
                              actions: <Widget>[
                                btnAltern(
                                  text: 'Sí, cambiar',
                                  bold: true,
                                  color: colorMain,
                                  onPressed: () {
                                    _.favoriteVet(id, name, image);
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
