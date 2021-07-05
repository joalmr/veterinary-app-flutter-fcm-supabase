import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'atender_mascota.dart';

class MascotaCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AtenderMascota());
        },
        child: const Image(
          height: 30,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/vote.png'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/dog.jpg'),
                ),
                Text(
                  'Pipo',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Text(
                  'Mestizo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Historial',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
            ),
          ),
          for (var i = 0; i < 4; i++)
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 5.5,
                  ),
                ],
              ),
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Fecha ####'),
                  Text('Serv ####'),
                ],
              ),
            )
        ],
      ),
    );
  }
}
