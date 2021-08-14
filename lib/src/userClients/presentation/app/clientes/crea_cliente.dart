import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/src/userClients/data/model/request/petlover.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';

class CreaCliente extends StatelessWidget {
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear cliente'),
          ),
          body: Center(
            child: Container(
              width: context.width < 900 ? double.maxFinite : 800,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre del cliente',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: lastnameController,
                    decoration: InputDecoration(
                      labelText: 'Apellido del cliente',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email del cliente',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Telf. del cliente',
                    ),
                  ),
                  SizedBox(height: 15),
                  btnPrimary(
                    text: 'Crear cliente',
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          lastnameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          phoneController.text.isEmpty) {
                        snackBarMessage(
                          type: TypeSnackBarName.ERROR,
                          message: 'Complete los datos',
                          seconds: 7,
                        );
                      } else {
                        final addpetlover = CreatePetloverReq(
                          name: nameController.text,
                          lastname: lastnameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        );
                        _.addPetlover(addpetlover);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
