import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/workers/domain/workersController.dart';

class VerAdmins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<WorkersController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
              child: const Text(
                'Administradores',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: _.carga.value
                  ? const Center(child: CircularProgressIndicator())
                  : _.workers.isEmpty
                      ? const Center(
                          child: Text('No tiene administradores'),
                        )
                      : ListView.builder(
                          itemCount: _.workers.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemBuilder: (BuildContext context, int index) {
                            final worker = _.workers[index];
                            return ChildRegion(
                              margin: const EdgeInsets.all(10),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Nombre',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(worker.name!),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Correo electrónico',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(worker.email!),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Establecimiento',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            worker.establishment!,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {},
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
