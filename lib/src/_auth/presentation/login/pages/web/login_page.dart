import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/images/images.dart';
import 'package:vet_app/src/_auth/presentation/login/widgets/card_login.dart';
import 'package:vet_app/src/_auth/presentation/login/widgets/portada.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Portada(),
          Expanded(
            child: SizedBox(
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Hero(
                              tag: 'logo',
                              child: Image(
                                height: Get.height * 0.18,
                                image: AssetImage(imgLogoProypet),
                              ),
                            ),
                            const SizedBox(height: 2.5),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CardLogin(),
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
