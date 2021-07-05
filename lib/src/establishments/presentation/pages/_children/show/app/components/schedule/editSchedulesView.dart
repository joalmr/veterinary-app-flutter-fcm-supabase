import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/resources/utils/days/dia_semana.dart';
import 'package:vet_app/src/establishments/domain/edit/editSchedulesController.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/app/widgets/itemHorario.dart';

class EditSchedulesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditSchedulesController>(
      init: EditSchedulesController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar horarios'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemHorario(
                    dayName: diaSemana[0],
                    index: 0,
                    // day: _.horarios.value.monday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[1],
                    index: 1,
                    // day: _.horarios.value.tuesday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[2],
                    index: 2,
                    // day: _.horarios.value.wednesday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[3],
                    index: 3,
                    // day: _.horarios.value.thursday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[4],
                    index: 4,
                    // day: _.horarios.value.friday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[5],
                    index: 5,
                    // day: _.horarios.value.saturday,
                  ),
                  ItemHorario(
                    dayName: diaSemana[6],
                    index: 6,
                    // day: _.horarios.value.sunday,
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: btnSecondary(
                      text: 'Guardar',
                      onPressed: _.setSchedule,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
