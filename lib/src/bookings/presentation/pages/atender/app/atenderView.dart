import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/components/condicionLista.dart';

import 'cirugia/cirugiaView.dart';
import 'components/tiposAtencionList.dart';
import 'consulta/consultaView.dart';
import 'desparasita/desparasitaView.dart';
import 'grooming/groomingView.dart';
import 'otro/otroView.dart';
import 'vacuna/vacunaView.dart';

class AtenderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (_) {
        print(condicionLista.length);
        return Scaffold(
          appBar: AppBar(
            title: Text('Atención'),
            actions: null,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Peso',
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Condición'),
                ),
                Material(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                  // child: Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton(
                  //       isExpanded: true,
                  //       value: _.condicion,
                  //       items: condicionLista.map((value) {
                  //         return new DropdownMenuItem<String>(
                  //           value: value.id,
                  //           child: Text(value.name),
                  //         );
                  //       }).toList(),
                  //       onChanged: (val) {
                  //         print(val);
                  //         // _.condicion.value = val.toString();
                  //       },
                  //     ),
                  //   ),
                  // ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView(
                    children: [
                      tipoAtencion(IconProypet.consulta, 'Consulta', '100', (){ Get.to(ConsultaView()); }),
                      tipoAtencion(IconProypet.cirugia, 'Cirugía', '', (){ Get.to(CirugiaView()); }),
                      tipoAtencion(IconProypet.desparasitacion,'Desparasitación', '', (){ Get.to(DesparasitaView()); }),
                      tipoAtencion(IconProypet.grooming, 'Grooming', '50', (){ Get.to(GroomingView());  }),
                      tipoAtencion(IconProypet.vacuna, 'Vacuna', '30', (){ Get.to(VacunaView()); }),
                      tipoAtencion(IconProypet.farmacia, 'Otros', '', (){ Get.to(OtroView()); }),
                      Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 10,left: 5,right: 5),
                        child: btnPrimary(
                          text: 'Finalizar atención',
                          onPressed: (){}
                        ),
                      ),
                    ],
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