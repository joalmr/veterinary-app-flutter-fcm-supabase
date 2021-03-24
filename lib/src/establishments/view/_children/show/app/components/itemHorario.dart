import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vet_app/design/styles/styles.dart';

class ItemHorario extends StatelessWidget {
  final String day;
  final bool daySwitch;
  final String iniDay;
  final String endDay;
  const ItemHorario({
    Key key,
    @required this.day,
    @required this.daySwitch,
    @required this.iniDay,
    @required this.endDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay pickedTime = TimeOfDay.now();
    TimeOfDay pickedTimeEnd = TimeOfDay.now();

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: daySwitch
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
              Text(day),
            ],
          ),
          daySwitch
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inicio'),
                    TextFormField(
                      enableInteractiveSelection: false,
                      initialValue: iniDay,
                      readOnly: true,
                      onTap: () {
                        final format = DateFormat("HH:mm");
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
                              hourLabel: "horas",
                              minuteLabel: "minutos",
                              okText: 'Aceptar',
                              cancelText: 'Cancelar',
                              onChangeDateTime: (DateTime dateTime) {
                                // _.v.iniDay[index] = format.format(dateTime);
                                // iniciaController.text = format.format(dateTime);
                              }),
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    Text('Fin'),
                    TextFormField(
                      enableInteractiveSelection: false,
                      initialValue: endDay,
                      readOnly: true,
                      onTap: () {
                        final format = DateFormat("HH:mm");
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
                              hourLabel: "horas",
                              minuteLabel: "minutos",
                              okText: 'Aceptar',
                              cancelText: 'Cancelar',
                              onChangeDateTime: (DateTime dateTime) {
                                // _.v.endDay[index] = format.format(dateTime);
                                // finController.text = format.format(dateTime);
                              }),
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
  }
}
