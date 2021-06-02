import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/bookings/domain/bookingController.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/components/condicionLista.dart';
import 'package:vet_app/src/bookings/presentation/widgets/dataNextdate.dart';

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
    return GetX<BookingController>(
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
                          image: CachedNetworkImageProvider(_.image),
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
                                  _.name,
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
                            Text('Raza: ${_.breed}'),
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
                  child: Container(
                    child: SingleChildScrollView(
                      child: !_.statusBooking.value
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          tipoAtencion(IconProypet.consulta, 'Consulta', '100', (){ Get.to(ConsultaView()); }),
                          tipoAtencion(IconProypet.cirugia, 'Cirugía', '', (){ Get.to(CirugiaView()); }),
                          tipoAtencion(IconProypet.desparasitacion,'Desparasitación', '', (){ Get.to(DesparasitaView()); }),
                          tipoAtencion(IconProypet.grooming, 'Grooming', '50', (){ Get.to(GroomingView());  }),
                          tipoAtencion(IconProypet.vacuna, 'Vacuna', '30', (){ Get.to(VacunaView()); }),
                          tipoAtencion(IconProypet.farmacia, 'Otros', '', (){ Get.to(OtroView()); }),
                        ],
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: dataNextdate
                                .map(
                                  (item) => Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    child: TextButton(
                                      child: Text(item['name']),
                                      onPressed: () => _.add2List(item),
                                      style: TextButton.styleFrom(
                                        textStyle: TextStyle(fontSize: 10),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5, horizontal: 5.0),
                                        alignment: Alignment.center,
                                        backgroundColor: _.listSet.contains(item)
                                            ? colorGreen
                                            : Colors.transparent,
                                        primary: _.listSet.contains(item)
                                            ? Colors.white
                                            : colorGreen,
                                        side: BorderSide(color: colorGreen),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                                .cast<Widget>(),
                            ),
                          ),
                          _.listNextdate.length==0
                          ? Center(child: Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: Text('Sin próximas citas'),
                          ))
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Próximas citas',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              for (var item in _.listNextdate)
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    DateTimePicker(
                                      dateMask: 'dd-MM-yyyy',
                                      initialValue: formatDate(DateTime.now()),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(Duration(days: 730)),
                                      dateLabelText: 'Fecha',
                                      onChanged: (val) => item.date = val,
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Observación',
                                      ),
                                      onChanged: (value) => item.observation = value,
                                      initialValue: item.observation,
                                      maxLines: 2,
                                      textCapitalization: TextCapitalization.sentences,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: !_.statusBooking.value
                    ? btnPrimary(
                      text: 'Continuar',
                      onPressed: (){
                        _.statusBooking.value = true;
                      }
                    )
                    : Row(
                      children: [
                        btnSecondary(text: 'Volver', onPressed: (){
                          _.statusBooking.value = false;
                        }),
                        SizedBox(width: 5),
                        Expanded(
                          child: btnPrimary(
                            text: 'Finalizar atención',
                            onPressed: (){
                              _.listNextdate.forEach((element) {
                                print(element.type);
                                print(element.name);
                                print(element.date);
                                print(element.observation);
                              });
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                // Padding(
                //   padding: const EdgeInsets.only(top: 30,bottom: 10,left: 5,right: 5),
                //   child: ,
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}