import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'atender_mascota.dart';
import 'components/container_stat_client.dart';
import 'mascota_cliente.dart';
import 'mascota_cliente_agregar.dart';

class ClienteVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int mascotas = 1;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: mascotas == 1
          ? FloatingActionButton(
              onPressed: () {
                Get.to(AtenderMascota());
              },
              child: const Image(
                height: 30,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/vote.png'),
              ),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Carlos Perez',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone_android_rounded),
                    Text(
                      '993932999',
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Mascotas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Get.to(MascotaClienteAgregar());
                      },
                      child: const CircleAvatar(
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
                  for (var i = 0; i < mascotas.bitLength; i++)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          Get.to(MascotaCliente());
                        },
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/dog.jpg'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: contStatClient(
              context: context,
              valor: 30930,
              titulo: 'atenciones',
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: contStatClient(
              context: context,
              valor: 1100220.50,
              titulo: 'soles',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
