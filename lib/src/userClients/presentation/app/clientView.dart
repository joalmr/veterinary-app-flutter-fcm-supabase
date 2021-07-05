import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'atenderMascota.dart';
import 'components/containerStatClient.dart';
import 'mascotaCliente.dart';

class ClienteVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int mascotas = 1;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: mascotas == 1
          ? FloatingActionButton(
              child: Image(
                height: 30,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/vote.png'),
              ),
              onPressed: () {
                Get.to(AtenderMascota());
              },
            )
          : null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Carlos Perez',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Mascotas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
            ),
          ),
          Container(
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
                        print('agrega');
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
                  for (var i = 0; i < mascotas.bitLength; i++)
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          print('detalle mascota $i');
                          Get.to(MascotaCliente());
                        },
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/dog.jpg'),
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
              valor: 30930,
              titulo: 'atenciones',
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: contStatClient(
              context: context,
              valor: 1100220.50,
              titulo: 'soles',
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
