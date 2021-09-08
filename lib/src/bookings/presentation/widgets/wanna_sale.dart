import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/sales/presentation/sales/add_sales.dart';

class WannaSale extends StatelessWidget {
  final int idPetlover;
  final String name;
  final String lastname;
  WannaSale({
    required this.idPetlover,
    required this.name,
    required this.lastname,
  });

  @override
  Widget build(BuildContext context) {
    double margenprox = (MediaQuery.of(context).size.height * 0.25);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: colorMain,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(top: margenprox),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart_rounded,
                            size: 150,
                            color: Colors.white.withOpacity(0.45),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Atención finalizada',
                            style: Get.textTheme.subtitle1!.copyWith(
                              // fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Desea generar una venta para $name $lastname?',
                            style: Get.textTheme.subtitle1!.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: btnSecondary(
                      text: 'Sí, generar venta',
                      onPressed: () {
                        Get.offAll(
                          AddSalesView(
                            petloverId: idPetlover,
                            name: name,
                            lastname: lastname,
                          ),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: btnSecondary(
                      text: 'No, ir a inicio',
                      onPressed: () {
                        Get.offAllNamed(NameRoutes.home);
                      },
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
