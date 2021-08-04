import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/userClients/data/model/request/pet.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';

class MascotaClienteAgregar extends StatelessWidget {
  final petNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Agregar mascota'),
          ),
          body: ListView(
            padding: EdgeInsets.all(8),
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Tipo mascota'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Raza'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: petNameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Sexo'),
              ),
              SizedBox(height: 15),
              btnPrimary(
                text: 'Crear mascota',
                onPressed: () {
                  if (petNameController.text.isEmpty) {
                    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                      content: const Text(
                        'Complete los datos',
                        style: TextStyle(color: colorRed),
                      ),
                      duration: const Duration(seconds: 7),
                      backgroundColor: Colors.black.withOpacity(0.85),
                    ));
                  } else {
                    final addpet = PetModelReq(
                      name: petNameController.text,
                      birthdate: DateTime(2020, 10, 10),
                      genre: 0,
                      specie: 1,
                      breed: 2,
                      userId: _.userId.value,
                    );
                    _.addPet(addpet);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
