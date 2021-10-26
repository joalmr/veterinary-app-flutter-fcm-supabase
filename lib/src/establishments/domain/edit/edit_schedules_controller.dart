import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/resources/utils/days/dia_semana.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

class EditSchedulesController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();
  final _global = Get.find<GlobalController>();
  // final vetController = Get.find<EstablishmentsController>();

  var checkDay = <bool>[].obs;
  var iniDay = <String>[].obs;
  var endDay = <String>[].obs;

  List<TextEditingController> iniController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> endController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  initDays() {
    checkDay.add(
        showVetController.establishment.value.schedule!.monday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.monday!.timeStart!);
    endDay
        .add(showVetController.establishment.value.schedule!.monday!.timeEnd!);
    iniController[0].text = iniDay[0];
    endController[0].text = endDay[0];

    checkDay.add(
        showVetController.establishment.value.schedule!.tuesday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.tuesday!.timeStart!);
    endDay
        .add(showVetController.establishment.value.schedule!.tuesday!.timeEnd!);
    iniController[1].text = iniDay[1];
    endController[1].text = endDay[1];

    checkDay.add(
        showVetController.establishment.value.schedule!.wednesday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.wednesday!.timeStart!);
    endDay.add(
        showVetController.establishment.value.schedule!.wednesday!.timeEnd!);
    iniController[2].text = iniDay[2];
    endController[2].text = endDay[2];

    checkDay.add(
        showVetController.establishment.value.schedule!.thursday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.thursday!.timeStart!);
    endDay.add(
        showVetController.establishment.value.schedule!.thursday!.timeEnd!);
    iniController[3].text = iniDay[3];
    endController[3].text = endDay[3];

    checkDay.add(
        showVetController.establishment.value.schedule!.friday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.friday!.timeStart!);
    endDay
        .add(showVetController.establishment.value.schedule!.friday!.timeEnd!);
    iniController[4].text = iniDay[4];
    endController[4].text = endDay[4];

    checkDay.add(
        showVetController.establishment.value.schedule!.saturday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.saturday!.timeStart!);
    endDay.add(
        showVetController.establishment.value.schedule!.saturday!.timeEnd!);
    iniController[5].text = iniDay[5];
    endController[5].text = endDay[5];

    checkDay.add(
        showVetController.establishment.value.schedule!.sunday!.daySwitch!);
    iniDay.add(
        showVetController.establishment.value.schedule!.sunday!.timeStart!);
    endDay
        .add(showVetController.establishment.value.schedule!.sunday!.timeEnd!);
    iniController[6].text = iniDay[6];
    endController[6].text = endDay[6];
  }

  @override
  void onInit() {
    initDays();
    super.onInit();
  }

  bool get validate {
    bool response = false;
    var diaError = '';
    var diaHoraError = '';
    for (var i = 0; i < 7; i++) {
      final String ini = iniController[i].text;
      final String end = endController[i].text;
      if (checkDay[i]) {
        if (ini.isEmpty || end.isEmpty) {
          diaError == ''
              ? diaError = diaError + diaSemana[i]
              : diaError = '$diaError, ${diaSemana[i]}';
        } else {
          final int iniNum = int.parse(ini.split(':')[0]);
          final int endNum = int.parse(end.split(':')[0]);
          if (iniNum >= endNum) {
            diaHoraError =
                '''Hora seleccionada incorrecta el día ${diaSemana[i]}, la hora de inicio es mayor a la de fin''';
          }
        }
      }
    }

    if (diaError != '' || diaHoraError != '') {
      if (diaError != '') {
        snackBarMessage(
          type: TypeSnackBarName.ERROR,
          message: 'Complete los datos de $diaError',
        );
      }
      if (diaHoraError != '') {
        snackBarMessage(
          type: TypeSnackBarName.ERROR,
          message: diaHoraError,
        );
      }
      response = true;
    }
    return response;
  }

  setSchedule() => _setSchedule();
  Future<void> _setSchedule() async {
    final schedule = {
      'monday': {
        'switch': checkDay[0],
        'time_start': iniDay[0],
        'time_end': endDay[0],
      },
      'tuesday': {
        'switch': checkDay[1],
        'time_start': iniDay[1],
        'time_end': endDay[1],
      },
      'wednesday': {
        'switch': checkDay[2],
        'time_start': iniDay[2],
        'time_end': endDay[2],
      },
      'thursday': {
        'switch': checkDay[3],
        'time_start': iniDay[3],
        'time_end': endDay[3],
      },
      'friday': {
        'switch': checkDay[4],
        'time_start': iniDay[4],
        'time_end': endDay[4],
      },
      'saturday': {
        'switch': checkDay[5],
        'time_start': iniDay[5],
        'time_end': endDay[5],
      },
      'sunday': {
        'switch': checkDay[6],
        'time_start': iniDay[6],
        'time_end': endDay[6],
      },
    };
    if (!validate) {
      await _repo.setSchedule(
          showVetController.establishment.value.id!, schedule);

      showVetController.getByid();
      // vetController.getAll();
      _global.generalLoad();
      Get.back();
      showVetController.initialTab.value = 3;
    }
  }
}
