import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/icons/proypet_icons.dart';
import 'package:vet_app/resources/utils/calcula_edad.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/bookings/domain/booking_controller.dart';
import 'package:vet_app/src/home/presentation/pages/web/dashboard/widgets/tab_select.dart';
import 'child/cirugia/cirugia_view.dart';
import 'child/consulta/consulta_view.dart';
import 'child/desparasita/desparasita_view.dart';
import 'child/grooming/grooming_view.dart';
import 'child/otro/otro_view.dart';
import 'child/testing/testing_view.dart';
import 'child/vacuna/vacuna_view.dart';
import 'components/proximaCita/proxima_cita.dart';
import 'components/tipos_atencion_list.dart';

class AtenderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<BookingController>(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
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
                            Text('Raza: ${_.petData.value.result!.breedName!}'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.book_rounded),
                        onPressed: () {
                          Get.toNamed('/history/${_.petId}');
                        },
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: _.pesoController,
                          decoration: InputDecoration(
                            labelText: 'Peso',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: 7.5),
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
                      SizedBox(height: 7.5),
                    ],
                  ),
                ),
                SizedBox(height: 5),
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
                  monto: _.desparasita.value?.amount?.toString() ?? '',
                  onTap: () => Get.to(DesparasitaView()),
                  onDelete: _.deleteDesparasita,
                ),
                tipoAtencion(
                  icon: IconProypet.grooming,
                  nombre: 'Grooming',
                  monto: _.grooming.value?.amount?.toString() ?? '',
                  onTap: () => Get.to(GroomingView()),
                  onDelete: _.deleteGrooming,
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
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 7.5),
                  child: Text(
                    'Próximas citas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      itemCitas(text: 'Consulta', slug: 'consultation'),
                      itemCitas(text: 'Desparasitación', slug: 'deworming'),
                      itemCitas(text: 'Grooming', slug: 'grooming'),
                      itemCitas(text: 'Vacunas', slug: 'vaccination'),
                    ],
                  ),
                ),
                if (_.listNextdate.isEmpty)
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 25),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () => _.removeList(item),
                                    icon: Icon(
                                      Icons.delete_forever_rounded,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              DateTimePicker(
                                dateMask: 'dd-MM-yyyy',
                                initialValue: formatDate(DateTime.now()),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 730)),
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
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Text(
                          _.montoTotal.value.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      btnPrimary(
                        text: 'Finalizar atención',
                        onPressed: () => _.saveFinalize(),
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
