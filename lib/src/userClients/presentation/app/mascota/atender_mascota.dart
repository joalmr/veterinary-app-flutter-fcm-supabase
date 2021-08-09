import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/userClients/data/model/find_user_model.dart';
import 'package:vet_app/src/userClients/domain/user_clients_controller.dart';

class AtenderMascota extends StatelessWidget {
  final PetClient petClient;
  const AtenderMascota({Key? key, required this.petClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeController = TextEditingController();
    TimeOfDay pickedTime = TimeOfDay.now();

    return GetX<ClientsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            CachedNetworkImageProvider(petClient.picture!),
                      ),
                      Text(
                        petClient.name!,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Text(
                        petClient.breedName!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Atender',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
                  ),
                ),
                !_.programaAtencion.value
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _.btnAtencion.value
                                  ? _.createBookingNow(petClient.id!)
                                  : null;
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              width: double.maxFinite,
                              height: 100,
                              decoration: BoxDecoration(
                                color: _.btnAtencion.value
                                    ? colorMain
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: colorMain.withOpacity(0.5),
                                    offset: Offset(1.1, 1.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Atender ahora',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _.programaAtencion.value =
                                  !_.programaAtencion.value;
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              width: double.maxFinite,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorMain,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: colorMain.withOpacity(0.5),
                                    offset: Offset(1.1, 1.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Programar atención',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Text(
                                'Programar atención',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              DateTimePicker(
                                dateMask: 'dd-MM-yyyy',
                                firstDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year + 3),
                                dateLabelText: 'Fecha',
                                onChanged: (val) => _.fecha.value = val,
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(labelText: 'Hora'),
                                enableInteractiveSelection: false,
                                controller: timeController,
                                readOnly: true,
                                onTap: () {
                                  final format = DateFormat('HH:mm');
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
                              SizedBox(height: 5),
                              Center(
                                child: btnSecondary(
                                  text: 'Programar',
                                  onPressed: () {
                                    _.btnAtencion.value
                                        ? _.createBookingLate(petClient.id!)
                                        : null;
                                  },
                                  color: _.btnAtencion.value
                                      ? colorMain
                                      : Colors.grey[400]!,
                                ),
                              ),
                              Center(
                                child: btnAltern(
                                  text: 'Cancelar',
                                  onPressed: () {
                                    _.programaAtencion.value = false;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
