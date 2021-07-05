import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/registros/domain/attentionsController.dart';
import 'package:vet_app/src/registros/presentation/widgets/checkFiltro.dart';

class FiltroAtenciones extends StatefulWidget {
  @override
  _FiltroAtencionesState createState() => _FiltroAtencionesState();
}

class _FiltroAtencionesState extends State<FiltroAtenciones> {
  @override
  Widget build(BuildContext context) {
    return GetX<AttentionsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Filtro de atenciones'),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    children: [
                      const SizedBox(height: 5),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        initialDate: toDateBasic(_.from.value),
                        initialValue: _.from.value,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha desde',
                        onChanged: (val) => _.from.value = val,
                      ),
                      const SizedBox(height: 10),
                      DateTimePicker(
                        dateMask: 'dd-MM-yyyy',
                        initialDate: toDateBasic(_.to.value),
                        initialValue: _.to.value,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                        dateLabelText: 'Fecha hasta',
                        onChanged: (val) => _.to.value = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Nombre de usuario'),
                        initialValue: _.userName.value,
                        onChanged: (val) => _.userName.value = val,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Nombre de mascota'),
                        initialValue: _.petName.value,
                        onChanged: (val) => _.petName.value = val,
                      ),
                      const SizedBox(height: 10),
                      const Text('Especies'),
                      CheckFiltro(
                        title: 'Perros',
                        checkBool: _.specie.contains(2) ? true : false,
                        onTapFn: () {
                          final bool hasSpecie = _.specie.contains(2);
                          if (hasSpecie) {
                            _.specie.remove(2);
                          } else {
                            _.specie.add(2);
                          }
                        },
                      ),
                      CheckFiltro(
                        title: 'Gatos',
                        checkBool: _.specie.contains(1) ? true : false,
                        onTapFn: () {
                          final bool hasSpecie = _.specie.contains(1);
                          if (hasSpecie) {
                            _.specie.remove(1);
                          } else {
                            _.specie.add(1);
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      // Text('Servicios'),
                      // SizedBox(height: 5),
                      // CheckFiltro(title: 'Consulta'),
                      // CheckFiltro(title: 'Cirugía'),
                      // CheckFiltro(title: 'Grooming'),
                      // CheckFiltro(title: 'Desparasitación'),
                      // CheckFiltro(title: 'Vacuna'),
                      // CheckFiltro(title: 'Examen'),
                      // CheckFiltro(title: 'Otros servicios'),
                      // SizedBox(height: 5),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                    bottom: 15,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: btnPrimary(
                      text: 'Buscar',
                      onPressed: () {
                        _.getAll();
                        Get.back();
                      },
                    ),
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
