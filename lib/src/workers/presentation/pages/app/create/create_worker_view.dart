import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/workers/domain/workers_controller.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

class CreaWorkerView extends StatelessWidget {
  const CreaWorkerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<WorkersController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Invitar administrador'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyRichText(
                  'Invitar administrador a ${prefUser.vetName}',
                  defaultStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  patternList: [
                    EasyRichTextPattern(
                      targetString: prefUser.vetName ?? '',
                      style: const TextStyle(color: colorMain),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _.emailText,
                  decoration: const InputDecoration(
                      labelText: 'Email del administrador a invitar'),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: btnPrimary(
                    text: 'Enviar invitación',
                    onPressed: () => _.setInvita(),
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(),
                const Text(
                  'Invitaciones pendientes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: _.workersInvitation.isEmpty
                      ? const Center(
                          child: Text(
                              'No tiene invitaciones pendientes de respuesta'),
                        )
                      : ListView.builder(
                          itemCount: _.workersInvitation.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          itemBuilder: (BuildContext context, int index) {
                            final workerInvitation = _.workersInvitation[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Fecha de invitación',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        formatDate(workerInvitation.createdAt!),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Establecimiento',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        workerInvitation.establishmentName!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Correo electrónico',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        workerInvitation.email!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('Eliminar'),
                                          content: const Text(
                                              '''Seguro que desea eliminar la invitación?'''),
                                          actions: <Widget>[
                                            btnAltern(
                                              text: 'Sí, eliminar',
                                              bold: true,
                                              color: colorRed,
                                              onPressed: () {
                                                _.deleteInvita(
                                                    workerInvitation.id!);
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
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Container(
                                      height: 32.0,
                                      width: 40.0,
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
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
