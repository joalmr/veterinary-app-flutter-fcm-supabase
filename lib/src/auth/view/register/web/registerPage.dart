import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/images/images.dart';
import 'package:vet_app/src/auth/view/components/portada.dart';
import 'package:vet_app/src/auth/view/register/components/cardRegister.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Portada(),
          Expanded(
            child: Container(
              child: Center(
                child: Container(
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeIn(
                          duration: Duration(milliseconds: 700),
                          child: JelloIn(
                            duration: Duration(milliseconds: 600),
                            child: Column(
                              children: [
                                Image(
                                  height: Get.height * 0.18,
                                  image: AssetImage(imgLogoProypet),
                                ),
                                SizedBox(height: 2.5),
                                Text(
                                  'Proveedores',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        CardRegister(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
