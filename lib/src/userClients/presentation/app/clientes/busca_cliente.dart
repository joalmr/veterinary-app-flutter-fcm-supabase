import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';
import 'package:vet_app/src/userClients/presentation/app/mascota/atender_mascota.dart';

class BuscaCliente extends StatelessWidget {
  final buscaCliente = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetX<ClientsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Buscar cliente'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: buscaCliente,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (buscaCliente.text.isEmpty) {
                            snackBarMessage(
                              message: 'Ingrese email de cliente',
                            );
                          } else {
                            _.findClients(buscaCliente.text);
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: colorMain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                _.findClient.value != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_.findClient.value!.name!} ${_.findClient.value!.lastname!}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.phone_android),
                                SizedBox(width: 5),
                                Text(
                                  _.findClient.value!.phone!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            SingleChildScrollView(
                              child: Row(
                                children: [
                                  for (var pet in _.findClient.value!.pets!)
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        onTap: () {
                                          pet.status == 0
                                              ? null
                                              : Get.to(
                                                  AtenderMascota(
                                                    petClient: pet,
                                                  ),
                                                );
                                        },
                                        child: CircleAvatar(
                                          radius: 45,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Stack(
                                              children: [
                                                Image(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          pet.picture!),
                                                ),
                                                Container(
                                                  color: pet.status == 0
                                                      ? Colors.black
                                                          .withOpacity(0.45)
                                                      : Colors.transparent,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(height: 0),
              ],
            ),
          ),
        );
      },
    );
  }
}
