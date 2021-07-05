import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/create/createVetController.dart';

class CheckHorario extends StatelessWidget {
  final String day;
  final int index;
  final TextEditingController iniController;
  final TextEditingController endController;
  const CheckHorario({
    required this.day,
    required this.index,
    required this.iniController,
    required this.endController,
  });

  @override
  Widget build(BuildContext context) {
    TimeOfDay pickedTime = TimeOfDay.now();
    TimeOfDay pickedTimeEnd = TimeOfDay.now();

    return GetX<CreateVetController>(
      builder: (_) {
        const edgeInsets = EdgeInsets.all(2.0);
        return SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _.v.checkDay[index] = !_.v.checkDay[index];
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: edgeInsets,
                      child: _.v.checkDay[index]
                          ? const Icon(
                              Icons.check_box_rounded,
                              color: colorMain,
                              size: 22,
                            )
                          : const Icon(
                              Icons.check_box_outline_blank_rounded,
                              color: colorMain,
                              size: 22,
                            ),
                    ),
                  ),
                  const SizedBox(width: 7.5),
                  Text(day),
                ],
              ),
              _.v.checkDay[index]
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Inicio'),
                          enableInteractiveSelection: false,
                          controller: iniController,
                          // initialValue: _.v.iniDay[index],
                          readOnly: true,
                          onTap: () {
                            final format = DateFormat('HH:mm');
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: pickedTime,
                                onChange: (TimeOfDay newTime) {
                                  pickedTime = newTime;
                                },
                                is24HrFormat: true,
                                minuteInterval: MinuteInterval.TEN,
                                maxMinute: 50,
                                barrierDismissible: false,
                                iosStylePicker: true,
                                hourLabel: 'horas',
                                minuteLabel: 'minutos',
                                okText: 'Aceptar',
                                cancelText: 'Cancelar',
                                onChangeDateTime: (DateTime dateTime) {
                                  _.v.iniDay[index] = format.format(dateTime);
                                  iniController.text = _.v.iniDay[index];
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Fin'),
                          enableInteractiveSelection: false,
                          controller: endController,
                          // initialValue: _.v.endDay[index],
                          readOnly: true,
                          onTap: () {
                            final format = DateFormat('HH:mm');
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: pickedTimeEnd,
                                onChange: (TimeOfDay newTime) {
                                  pickedTimeEnd = newTime;
                                },
                                is24HrFormat: true,
                                minuteInterval: MinuteInterval.TEN,
                                maxMinute: 50,
                                barrierDismissible: false,
                                iosStylePicker: true,
                                hourLabel: 'horas',
                                minuteLabel: 'minutos',
                                okText: 'Aceptar',
                                cancelText: 'Cancelar',
                                onChangeDateTime: (DateTime dateTime) {
                                  _.v.endDay[index] = format.format(dateTime);
                                  endController.text = _.v.endDay[index];
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 5),
                      ],
                    )
                  : const SizedBox(height: 0),
            ],
          ),
        );
      },
    );
  }
}
