import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';

import 'components/tiposAtencionList.dart';

class AtenderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Atención'),
            actions: null,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage('assets/images/dog.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Pipo',
                                  style: Get.textTheme.subtitle1
                                      .apply(fontWeightDelta: 2),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.pets_rounded,
                                  size: 18,
                                  color: colorMain,
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text('Edad: 2 años 3 meses'),
                            Text('Tipo: Perro'),
                            Text('Raza: Mestizo mediano'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.book_rounded),
                        onPressed: () {},
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Peso',
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: formularioText(
                //     icon: IconProypet.peso,
                //     hintText: 'Ingrese peso',
                //     boardType: TextInputType.number,
                //     // boardType: TextInputType.numberWithOptions(
                //     //     signed: false, decimal: true),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: ddlMain(context, _.condicion, condicionLista, (opt) {
                //     _.condicion = opt.toString();
                //   }),
                // ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView(
                    children: [
                      tipoAtencion(IconProypet.consulta, 'Consulta', 'consulta', '100'),
                      tipoAtencion(IconProypet.cirugia, 'Cirugía', 'cirugia', ''),
                      tipoAtencion(IconProypet.desparasitacion,'Desparasitación', 'desparasitacion', ''),
                      tipoAtencion(IconProypet.grooming, 'Grooming', 'grooming', '50'),
                      tipoAtencion(IconProypet.vacuna, 'Vacuna', 'vacuna', '30'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: btnPrimary(
                    text: 'Finalizar atención',
                    onPressed: (){}
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}