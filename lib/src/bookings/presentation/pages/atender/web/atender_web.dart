import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/_pet/presentation/pages/pet_history/view.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/cirugia/cirugia_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/consulta/consulta_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/desparasita/desparasita_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/grooming/grooming_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/otro/otro_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/testing/testing_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/child/vacuna/vacuna_view.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/components/proximaCita/proxima_cita.dart';
import 'package:vet_app/src/bookings/presentation/pages/atender/app/components/tipos_atencion_list.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tab_select.dart';

class AtenderWeb extends StatelessWidget {
  AtenderWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.width < 900
                  ? SizedBox(height: 0)
                  : Container(
                      margin:
                          EdgeInsets.only(left: 30.0, top: 25.0, bottom: 10.0),
                      child: Text(
                        'Atención',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Wrap(
                  children: [
                    Container(
                      width: 450,
                      height: 120,
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(
                                height: 100,
                                width: 100,
                                image: CachedNetworkImageProvider(
                                    _.petData.value.result!.picture!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        _.petData.value.result!.name!,
                                        style: Get.textTheme.subtitle1!
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
                                  Text(
                                      'Edad: ${calculateAge(_.petData.value.result!.birthdate)}'),
                                  Text(
                                      'Tipo: ${_.petData.value.result!.specieName!}'),
                                  Text(
                                      'Raza: ${_.petData.value.result!.breedName!}'),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.book_rounded),
                              onPressed: () {
                                Get.to(PetHistoryPage(), arguments: _.petId);
                              },
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 450,
                      height: 120,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                controller: _.pesoController,
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
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      _.selected.value = 0;
                                    },
                                    child: tabSelect(
                                      selected: _.selected.value == 0,
                                      text: 'Muy delgado',
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      _.selected.value = 1;
                                    },
                                    child: tabSelect(
                                      selected: _.selected.value == 1,
                                      text: 'Bajo peso',
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      _.selected.value = 2;
                                    },
                                    child: tabSelect(
                                      selected: _.selected.value == 2,
                                      text: 'Ideal',
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      _.selected.value = 3;
                                    },
                                    child: tabSelect(
                                      selected: _.selected.value == 3,
                                      text: 'Sobrepeso',
                                    ),
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(20.0),
                                    onTap: () {
                                      _.selected.value = 4;
                                    },
                                    child: tabSelect(
                                      selected: _.selected.value == 4,
                                      text: 'Obeso',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: context.width < 900 ? 1 : 3,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          tipoAtencion(
                            icon: IconProypet.consulta,
                            nombre: 'Consulta',
                            monto: _.consulta.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(ConsultaView()),
                            onDelete: _.deleteConsulta,
                          ),
                          tipoAtencion(
                            icon: IconProypet.cirugia,
                            nombre: 'Cirugía',
                            monto: _.cirugia.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(CirugiaView()),
                            onDelete: _.deleteCirugia,
                          ),
                          tipoAtencion(
                            icon: IconProypet.desparasitacion,
                            nombre: 'Desparasitación',
                            monto:
                                _.desparasita.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(DesparasitaView()),
                            onDelete: _.deleteDesparasita,
                          ),
                          tipoAtencion(
                            icon: IconProypet.grooming,
                            nombre: 'Grooming',
                            monto: 'falta',
                            onTap: () => Get.to(GroomingView()),
                            onDelete: () {},
                          ),
                          tipoAtencion(
                            icon: IconProypet.vacuna,
                            nombre: 'Vacuna',
                            monto: _.vacunas.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(VacunaView()),
                            onDelete: _.deleteVacuna,
                          ),
                          tipoAtencion(
                            icon: IconProypet.tuboEnsayo,
                            nombre: 'Exámenes',
                            monto: _.examenes.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(TestingView()),
                            onDelete: _.deleteExamen,
                          ),
                          tipoAtencion(
                            icon: IconProypet.farmacia,
                            nombre: 'Otros',
                            monto: _.otros.value?.amount?.toString() ?? '',
                            onTap: () => Get.to(OtroView()),
                            onDelete: _.deleteOtros,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              'Próximas citas',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                itemCitas(
                                    text: 'Consulta', slug: 'consultation'),
                                itemCitas(
                                    text: 'Desparasitación', slug: 'deworming'),
                                itemCitas(text: 'Grooming', slug: 'grooming'),
                                itemCitas(text: 'Vacunas', slug: 'vaccination'),
                              ],
                            ),
                          ),
                          if (_.listNextdate.isEmpty)
                            Center(
                                child: Padding(
                              padding: EdgeInsets.only(top: 35),
                              child: Text('Sin próximas citas'),
                            ))
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.name!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  _.removeList(item),
                                              icon: Icon(
                                                Icons.delete_forever_rounded,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        DateTimePicker(
                                          dateMask: 'dd-MM-yyyy',
                                          initialValue:
                                              formatDate(DateTime.now()),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 730)),
                                          dateLabelText: 'Fecha',
                                          onChanged: (val) => item.date = val,
                                        ),
                                        SizedBox(height: 5),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Observación',
                                          ),
                                          onChanged: (value) =>
                                              item.observation = value,
                                          initialValue: item.observation,
                                          maxLines: 2,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                child: btnPrimary(
                  text: 'Finalizar atención',
                  onPressed: () => _.saveFinalize(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
