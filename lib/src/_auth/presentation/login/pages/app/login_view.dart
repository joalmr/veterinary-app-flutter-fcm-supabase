import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/images/images.dart';
import 'package:vet_app/src/_auth/presentation/login/widgets/card_login.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          top: context.height * 0.15,
          left: context.width * 0.1,
          right: context.width * 0.1,
        ),
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
              SizedBox(height: 2.5),
            ],
          ),
          CardLogin(),
        ],
      ),
    );
  }
}
