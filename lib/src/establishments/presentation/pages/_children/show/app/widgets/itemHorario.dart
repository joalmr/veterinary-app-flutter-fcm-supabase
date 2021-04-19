import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/establishments/domain/edit/editSchedulesController.dart';

class ItemHorario extends StatelessWidget {
  final String dayName;
  final int index;

  const ItemHorario({this.dayName, this.index});

  @override
  Widget build(BuildContext context) {
    TimeOfDay pickedTime = TimeOfDay.now();
    TimeOfDay pickedTimeEnd = TimeOfDay.now();

    return GetX<EditSchedulesController>(
      builder: (_) {
        return Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _.checkDay[index] = !_.checkDay[index];
                      print(_.checkDay[index]);
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: _.checkDay[index]
                          ? Icon(
                              Icons.check_box_rounded,
                              color: colorMain,
                              size: 22,
                            )
                          : Icon(
                              Icons.check_box_outline_blank_rounded,
                              color: colorMain,
                              size: 22,
                            ),
                    ),
                  ),
                  SizedBox(width: 7.5),
                  Text(dayName),
                ],
              ),
              _.checkDay[index]
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Inicio'),
                          enableInteractiveSelection: false,
                          controller: _.iniController[index],
                          readOnly: true,
                          onTap: () {
                            final format = DateFormat("HH:mm");
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: pickedTime,
                                onChange: (TimeOfDay newTime) =>
                                    pickedTime = newTime,
                                is24HrFormat: true,
                                minuteInterval: MinuteInterval.TEN,
                                maxMinute: 50,
                                barrierDismissible: false,
                                iosStylePicker: true,
                                hourLabel: "horas",
                                minuteLabel: "minutos",
                                okText: 'Aceptar',
                                cancelText: 'Cancelar',
                                onChangeDateTime: (DateTime dateTime) {
                                  _.iniDay[index] = format.format(dateTime);
                                  _.iniController[index].text = _.iniDay[index];
                                  print(_.iniDay[index]);
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Fin'),
                          enableInteractiveSelection: false,
                          controller: _.endController[index],
                          readOnly: true,
                          onTap: () {
                            final format = DateFormat("HH:mm");
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: pickedTimeEnd,
                                onChange: (TimeOfDay newTime) =>
                                    pickedTimeEnd = newTime,
                                is24HrFormat: true,
                                minuteInterval: MinuteInterval.TEN,
                                maxMinute: 50,
                                barrierDismissible: false,
                                iosStylePicker: true,
                                hourLabel: "horas",
                                minuteLabel: "minutos",
                                okText: 'Aceptar',
                                cancelText: 'Cancelar',
                                onChangeDateTime: (DateTime dateTime) {
                                  _.endDay[index] = format.format(dateTime);
                                  _.endController[index].text = _.endDay[index];
                                  print(_.endDay[index]);
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 5),
                      ],
                    )
                  : SizedBox(height: 0),
            ],
          ),
        );
      },
    );
  }
}
