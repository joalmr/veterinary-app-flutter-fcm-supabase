import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/bookings/domain/reprogramar/reprogramar_controller.dart';

class ContentReprograma extends StatelessWidget {
  final String? bookingId;
  final String? petImg;
  final String? petName;
  final String? petBreed;
  final String? date;
  final String? time;
  final String? userName;
  final String? userPhone;
  final Color? color;
  final String? status;
  const ContentReprograma({
    Key? key,
    this.bookingId,
    this.petImg,
    this.petName,
    this.petBreed,
    this.date,
    this.time,
    this.userName,
    this.userPhone,
    this.color,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeController = TextEditingController();
    TimeOfDay pickedTime = TimeOfDay.now();

    return GetX<ReprogramarController>(
      init: ReprogramarController(),
      builder: (_) {
        return SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 88.0,
                    width: 88.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                          imageUrl: petImg!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.shade200,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        petBreed!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$date $time',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            height: 7.5,
                            width: 7.5,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            status!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        userName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userPhone!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Text('Fecha'),
              const SizedBox(height: 5),
              // dateForm(onChanged: (val) => _.fecha.value = val),
              DateTimePicker(
                dateMask: 'dd-MM-yyyy',
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 3),
                dateLabelText: 'Fecha hasta',
                onChanged: (val) => _.fecha.value = val,
              ),
              const SizedBox(height: 10),
              const Text('Hora'),
              const SizedBox(height: 5),
              // timeForm(onChanged: (val) => _.hora.value = val),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hora'),
                enableInteractiveSelection: false,
                controller: timeController,
                readOnly: true,
                onTap: () {
                  final format = DateFormat('HH:mm');
                  Navigator.of(context).push(
                    showPicker(
                      context: context,
                      value: pickedTime,
                      onChange: (TimeOfDay newTime) => pickedTime = newTime,
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
                        _.hora.value = format.format(dateTime);
                        timeController.text = _.hora.value;
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Center(
                child: btnSecondary(
                  text: 'Reprogramar',
                  color: Colors.grey[600]!,
                  onPressed: () => _.reprogramar(bookingId!),
                ),
              ),
              if (_.errorDateTime.value)
                FadeIn(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.all(5),
                      width: 250,
                      decoration: BoxDecoration(
                        color: colorRed,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _.msgfecha.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              _.msghora.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(height: 0),
            ],
          ),
        );
      },
    );
  }
}
