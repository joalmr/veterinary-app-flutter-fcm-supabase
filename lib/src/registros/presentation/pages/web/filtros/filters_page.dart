import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/subheader.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/registros/domain/attentions_controller.dart';
import 'package:vet_app/src/registros/presentation/widgets/check_filtro.dart';

class MiniStatAttention extends StatefulWidget {
  @override
  _MiniStatAttentionState createState() => _MiniStatAttentionState();
}

class _MiniStatAttentionState extends State<MiniStatAttention> {
  @override
  Widget build(BuildContext context) {
    return GetX<AttentionsController>(
      builder: (_) {
        return Container(
          color: Color(0xffF7F7FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              subHeader(title: 'Filtros'),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  children: [
                    // Text('Fecha desde'),
                    // dateForm(),
                    DateTimePicker(
                      dateMask: 'dd-MM-yyyy',
                      initialDate: toDateBasic(_.from.value),
                      initialValue: _.from.value,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      dateLabelText: 'Fecha desde',
                      onChanged: (val) => _.from.value = val,
                    ),
                    SizedBox(height: 10),
                    // Text('Fecha hasta'),
                    // dateForm(),
                    DateTimePicker(
                      dateMask: 'dd-MM-yyyy',
                      initialDate: toDateBasic(_.to.value),
                      initialValue: _.to.value,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                      dateLabelText: 'Fecha hasta',
                      onChanged: (val) => _.to.value = val,
                    ),

                    SizedBox(height: 15),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Nombre de usuario'),
                      initialValue: _.userName.value,
                      onChanged: (val) => _.userName.value = val,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Nombre de mascota'),
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
                    // SizedBox(height: 10),
                    // Text('Servicios'),
                    // SizedBox(height: 5),
                    // CheckFiltro(title: 'Consulta'),
                    // CheckFiltro(title: 'Cirugía'),
                    // CheckFiltro(title: 'Grooming'),
                    // CheckFiltro(title: 'Desparasitación'),
                    // CheckFiltro(title: 'Vacuna'),
                    // CheckFiltro(title: 'Examen'),
                    // CheckFiltro(title: 'Otros servicios'),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: btnPrimary(
                    text: 'Buscar',
                    onPressed: () {
                      _.getAll();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
