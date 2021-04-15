import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/_auth/domain/loginController.dart';

class CardLogin extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      builder: (_) {
        return Form(
          // key: _formKey,
          child: Card(
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 30,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Ingrese email',
                      ),
                      onChanged: (val) => _.email = val,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      // textInputAction: TextInputAction.unspecified,
                      decoration: InputDecoration(
                        labelText: 'Ingrese contraseña',
                      ),
                      obscureText: true,
                      onChanged: (val) => _.password = val,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: double.maxFinite,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: _.btnLogIn.value
                            ? [
                                colorGreen,
                                colorMain,
                              ]
                            : [
                                Colors.black38,
                                Colors.black45,
                              ],
                      ),
                    ),
                    child: InkWell(
                      onTap: _.btnLogIn.value ? () => _.logIn() : null,
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox.expand(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _.btnLogIn.value
                                ? SizedBox(width: 0)
                                : Container(
                                    margin: EdgeInsets.only(right: 2.0),
                                    padding: EdgeInsets.all(5.0),
                                    child: CircularProgressIndicator(),
                                  ),
                            Text(
                              'Ingresar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Olvidé contraseña',
                        style: TextStyle(color: colorMain),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _.errorLogIn.value
                      ? FadeIn(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: colorRed,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Text(
                                'Usuario o clave incorrecto',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(height: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
