import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/recursos/utils/days/diaSemana.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/app/widgets/itemHorario.dart';

class EditSchedulesView extends StatelessWidget {
  final Schedule schedule;

  const EditSchedulesView({this.schedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar horarios'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ItemHorario(
              day: diaSemana[0],
              daySwitch: schedule.monday.daySwitch,
              iniDay: schedule.monday.timeStart,
              endDay: schedule.monday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[1],
              daySwitch: schedule.tuesday.daySwitch,
              iniDay: schedule.tuesday.timeStart,
              endDay: schedule.tuesday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[2],
              daySwitch: schedule.wednesday.daySwitch,
              iniDay: schedule.wednesday.timeStart,
              endDay: schedule.wednesday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[3],
              daySwitch: schedule.thursday.daySwitch,
              iniDay: schedule.thursday.timeStart,
              endDay: schedule.thursday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[4],
              daySwitch: schedule.friday.daySwitch,
              iniDay: schedule.friday.timeStart,
              endDay: schedule.friday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[5],
              daySwitch: schedule.saturday.daySwitch,
              iniDay: schedule.saturday.timeStart,
              endDay: schedule.saturday.timeEnd,
            ),
            ItemHorario(
              day: diaSemana[6],
              daySwitch: schedule.sunday.daySwitch,
              iniDay: schedule.sunday.timeStart,
              endDay: schedule.sunday.timeEnd,
            ),
            SizedBox(height: 15),
            Center(
              child: btnSecondary(
                text: 'Guardar',
                onPressed: () {},
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: btnAltern(
                text: 'Volver',
                onPressed: () => Get.back(),
                bold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
