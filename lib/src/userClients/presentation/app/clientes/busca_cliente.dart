import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/sales/presentation/sales/add_sales.dart';
import 'package:vet_app/src/userClients/domain/find_clients_controller.dart';
import 'package:vet_app/src/userClients/presentation/app/mascota/atender_mascota.dart';

class BuscaCliente extends StatelessWidget {
  final buscaCliente = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetX<FindClientsController>(
      init: FindClientsController(),
      builder: (_) {
        return MainLayout(
          title: 'Buscar cliente',
          body: Center(
            child: Container(
              width: context.width < 900 ? double.maxFinite : 800,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: buscaCliente,
                        decoration: InputDecoration(
                          hintText: 'Ingrese email de cliente',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (buscaCliente.text.isEmpty) {
                                snackBarMessage(
                                  message: 'Ingrese email del cliente',
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
                                GetPlatform.isWeb
                                    ? SizedBox(height: 0)
                                    : InkWell(
                                        borderRadius: BorderRadius.circular(5),
                                        onTap: () {
                                          Get.to(
                                            AddSalesView(
                                              petloverId:
                                                  _.userIdSupabase.value,
                                              name: _.findClient.value!.name!,
                                              lastname:
                                                  _.findClient.value!.lastname!,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 8),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: colorMain,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.shopping_cart_rounded,
                                                color: colorWhite,
                                                size: 26,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'Venta de productos',
                                                style: TextStyle(
                                                  color: colorWhite,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
            ),
          ),
        );
      },
    );
  }
}
