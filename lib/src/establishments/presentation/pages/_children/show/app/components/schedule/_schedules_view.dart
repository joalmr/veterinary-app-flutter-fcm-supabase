import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/days/dia_semana.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';
import '../../widgets/schedule_show.dart';
import 'edit_schedules_view.dart';

class SchedulesView extends StatelessWidget {
  final Schedule schedule;
  const SchedulesView({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 10.0,
              bottom: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Horarios',
                  style: Get.textTheme.subtitle2!.apply(fontWeightDelta: 2),
                ),
                IconButton(
                  splashRadius: 20,
                  iconSize: 18,
                  icon: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    Get.to(EditSchedulesView()); //schedule: schedule
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                horario(
                  day: diaSemana[0],
                  daySwitch: schedule.monday!.daySwitch!,
                  timeStart: schedule.monday!.timeStart!,
                  timeEnd: schedule.monday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[1],
                  daySwitch: schedule.tuesday!.daySwitch!,
                  timeStart: schedule.tuesday!.timeStart!,
                  timeEnd: schedule.tuesday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[2],
                  daySwitch: schedule.wednesday!.daySwitch!,
                  timeStart: schedule.wednesday!.timeStart!,
                  timeEnd: schedule.wednesday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[3],
                  daySwitch: schedule.thursday!.daySwitch!,
                  timeStart: schedule.thursday!.timeStart!,
                  timeEnd: schedule.thursday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[4],
                  daySwitch: schedule.friday!.daySwitch!,
                  timeStart: schedule.friday!.timeStart!,
                  timeEnd: schedule.friday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[5],
                  daySwitch: schedule.saturday!.daySwitch!,
                  timeStart: schedule.saturday!.timeStart!,
                  timeEnd: schedule.saturday!.timeEnd!,
                ),
                horario(
                  day: diaSemana[6],
                  daySwitch: schedule.sunday!.daySwitch!,
                  timeStart: schedule.sunday!.timeStart!,
                  timeEnd: schedule.sunday!.timeEnd!,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
