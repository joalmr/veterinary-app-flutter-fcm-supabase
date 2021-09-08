import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/userClients/data/model/request/petlover.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';

class CreaCliente extends StatefulWidget {
  @override
  _CreaClienteState createState() => _CreaClienteState();
}

class _CreaClienteState extends State<CreaCliente> {
  final nameController = TextEditingController();

  final lastnameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  bool notEmail = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientsController>(
      builder: (_) {
        return MainLayout(
          title: 'Crear cliente',
          body: Center(
            child: Container(
              width: context.width < 900 ? double.maxFinite : 800,
              child: ListView(
                padding: EdgeInsets.all(8),
                children: [
                  context.width >= 900
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 25.0,
                            bottom: 10.0,
                          ),
                          child: Text(
                            'Crear cliente',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      : SizedBox(height: 0),
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
                  notEmail
                      ? SizedBox(height: 0)
                      : TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email del cliente',
                          ),
                        ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            notEmail = !notEmail;
                          });
                        },
                        icon: Icon(notEmail
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_rounded),
                      ),
                      Text(
                        'No tiene email',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
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
                          phoneController.text.isEmpty) {
                        snackBarMessage(
                          type: TypeSnackBarName.ERROR,
                          message: 'Complete los datos',
                          seconds: 7,
                        );
                      } else {
                        String emailTxt = '';
                        if (notEmail == false && emailController.text.isEmpty) {
                          snackBarMessage(
                            type: TypeSnackBarName.ERROR,
                            message: 'Ingreso email',
                            seconds: 5,
                          );
                        } else {
                          if (notEmail) {
                            emailTxt =
                                '${nameController.text.removeAllWhitespace.toLowerCase()}${lastnameController.text.removeAllWhitespace.toLowerCase()}${formatDateEmail(DateTime.now())}@proypet.com';
                          } else {
                            emailTxt = emailController.text;
                          }

                          final addpetlover = CreatePetloverReq(
                            name: nameController.text,
                            lastname: lastnameController.text,
                            email: emailTxt,
                            phone: phoneController.text,
                          );
                          _.addPetlover(addpetlover);
                        }
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
