import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';
import '../components/container_stat_client.dart';
import '../mascota/atender_mascota.dart';
import '../mascota/mascota_cliente_agregar.dart';

class ClienteVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ClientsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: _.loadUserPets.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_.resultUserClient.value!.user!.name!} ${_.resultUserClient.value!.user!.lastname!}',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone_android_rounded),
                              Text(
                                _.resultUserClient.value!.user!.phone!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Mascotas',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w200),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                onTap: () {
                                  Get.to(MascotaClienteAgregar());
                                },
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: colorMain,
                                  child: Icon(
                                    Icons.add_rounded,
                                    size: 45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            for (var i = 0;
                                i <
                                    _.resultUserClient.value!.user!.pets!
                                        .length;
                                i++)
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: () {
                                    _.resultUserClient.value!.user!.pets![i]
                                                .status ==
                                            0
                                        ? null
                                        : Get.to(
                                            AtenderMascota(
                                              petClient: _.resultUserClient
                                                  .value!.user!.pets![i],
                                            ),
                                          );
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Stack(
                                            children: [
                                              Image(
                                                image:
                                                    CachedNetworkImageProvider(_
                                                        .resultUserClient
                                                        .value!
                                                        .user!
                                                        .pets![i]
                                                        .picture!),
                                              ),
                                              Container(
                                                color: _
                                                            .resultUserClient
                                                            .value!
                                                            .user!
                                                            .pets![i]
                                                            .status ==
                                                        0
                                                    ? Colors.black
                                                        .withOpacity(0.45)
                                                    : Colors.transparent,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        _.resultUserClient.value!.user!.pets![i]
                                            .name!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: contStatClient(
                        context: context,
                        valor: _.resultUserClient.value!.attentions!.toDouble(),
                        titulo: 'atenciones',
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: contStatClient(
                        context: context,
                        valor: _.resultUserClient.value!.amount!,
                        titulo: 'soles',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
        );
      },
    );
  }
}
