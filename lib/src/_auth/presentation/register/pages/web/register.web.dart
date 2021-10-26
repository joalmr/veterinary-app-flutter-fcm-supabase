import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/images/images.dart';
import 'package:vet_app/src/_auth/presentation/login/widgets/portada.dart';
import 'package:vet_app/src/_auth/presentation/register/widgets/card_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Portada(),
          Expanded(
            child: SizedBox(
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeIn(
                          duration: const Duration(milliseconds: 700),
                          child: JelloIn(
                            duration: const Duration(milliseconds: 600),
                            child: Column(
                              children: [
                                Image(
                                  height: Get.height * 0.18,
                                  image: AssetImage(imgLogoProypet),
                                ),
                                const SizedBox(height: 2.5),
                                const Text(
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
                        const SizedBox(height: 30),
                        const CardRegister(),
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
