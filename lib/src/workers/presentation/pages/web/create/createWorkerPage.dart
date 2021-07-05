import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/childRegion.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/workers/domain/workersController.dart';

class CreaAdmin extends StatelessWidget {
  //! mensaje cuando ya no puede invitar a un administrador
  @override
  Widget build(BuildContext context) {
    // final emailFocusNode = FocusScope.of(context);

    return GetX<WorkersController>(
      builder: (_) {
        return Container(
          color: const Color(0xffF7F7FF),
          child: _.carga.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    subHeader(
                      title: 'Invitar administrador a ${prefUser.vetName}',
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _.emailText,
                            decoration: const InputDecoration(
                                labelText: 'Email del administrador a invitar'),
                            keyboardType: TextInputType.emailAddress,
                            // focusNode: emailFocusNode,
                          ),
                          const SizedBox(height: 10.0),
                          SizedBox(
                            width: double.infinity,
                            child: btnPrimary(
                                text: 'Enviar invitación',
                                onPressed: () {
                                  // emailFocusNode.unfocus();
                                  _.setInvita();
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: const Text(
                        'Invitaciones pendientes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: _.workersInvitation.isEmpty
                          ? const Center(
                              child: Text(
                                  '''No tiene invitaciones pendientes de respuesta'''),
                            )
                          : ListView.builder(
                              itemCount: _.workersInvitation.length,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              itemBuilder: (BuildContext context, int index) {
                                final workerInvitation =
                                    _.workersInvitation[index];
                                return ChildRegion(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Fecha de invitación',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          formatDate(
                                              workerInvitation.createdAt!),
                                        ),
                                        const SizedBox(height: 2.5),
                                        const Text(
                                          'Establecimiento',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          workerInvitation.establishmentName!,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 2.5),
                                        const Text(
                                          'Correo electrónico',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(workerInvitation.email!),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () => _.deleteInvita(
                                              workerInvitation.id),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
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
                ),
        );
      },
    );
  }
}
