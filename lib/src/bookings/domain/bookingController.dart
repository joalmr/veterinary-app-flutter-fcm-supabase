import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/bookings/data/bookingRepository.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultationBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgeryBooking.dart';
import 'package:vet_app/src/bookings/presentation/widgets/dataNextdate.dart';

class BookingController extends GetxController {
  final _repo = BookingRepository();
  RxString condicion = "".obs;

  RxBool statusBooking = false.obs;

  RxList<DataNextdate> listNextdate = <DataNextdate>[].obs;

  String bookingId;
  String petId;
  String specie;
  String breed;
  String name;
  String image;
  String birthday;

  Rx<ConsultationBooking> consulta;

  String attentionId;

  @override
  void onInit() {
    super.onInit();
    bookingId = Get.arguments['bookingId'];
    petId = Get.arguments['petId'];
    specie = Get.arguments['specie'];
    breed = Get.arguments['breed'];
    name = Get.arguments['name'];
    image = Get.arguments['image'];
    birthday = Get.arguments['birthday'];
    //
    _repo.attend(prefUser.vetId, bookingId).then((value) {
      print(value);
      final dato = jsonDecode(value);
      attentionId = dato['attention_id'];
    });
  }

  @override
  void onClose() {
    if (Get.context.width < 900) Get.close(1);
    super.onClose();
  }

  saveConsulta(ConsultationBooking data) => _saveConsulta(data);
  _saveConsulta(ConsultationBooking data) async {
    print('consulta');
    await _repo.saveConsultation(prefUser.vetId, attentionId, data);
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Consulta',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveCirugia(SurgeryBooking data) => _saveCirugia(data);
  _saveCirugia(SurgeryBooking data) async {
    print('cirugia');
    await _repo.saveSurgery(prefUser.vetId, attentionId, data);
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Cirugía',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveDesparasitacion() => _saveDesparasitacion();
  _saveDesparasitacion() async {
    print('jsonEncode(data)');
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Desparasitación',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveVacuna() => _saveVacuna();
  _saveVacuna() {
    print('jsonEncode(data)');
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Vacuna',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveGrooming() => _saveGrooming();
  _saveGrooming() {
    print('jsonEncode(data)');
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Grooming',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveExamenes() => _saveExamenes();
  _saveExamenes() {
    print('jsonEncode(data)');
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Exámenes',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  saveOtro() => _saveOtro();
  _saveOtro() {
    print('jsonEncode(data)');
    ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
      content: Text(
        'Se guardó Otros',
        style: TextStyle(color: colorMain),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void add2List(dynamic dato) {
    if (listNextdate.where((x) => x.type == dato['type']).length > 0) {
      ScaffoldMessenger.of(Get.context).showSnackBar(SnackBar(
        content: Text('Ya tiene una próxima cita de este tipo'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      Get.back();
    } else {
      var temp = DataNextdate(
        type: dato['type'],
        name: dato['name'],
        date: formatDateBasic(DateTime.now()),
        observation: '-',
      );
      listNextdate.add(temp);
      Get.back();
      // print(jsonEncode(listNextdate));
    }
  }

  void removeList(DataNextdate dato) {
    Get.dialog(
      AlertDialog(
        title: Text('Eliminar'),
        content:
            Text('Seguro que desea eliminar próxima cita de ${dato.name}?'),
        actions: <Widget>[
          btnAltern(
            text: 'Cancelar',
            onPressed: () => Get.back(),
          ),
          btnAltern(
            text: 'Eliminar',
            onPressed: () {
              listNextdate.removeWhere((element) => element.name == dato.name);
              Get.back();
            },
            color: colorRed,
          ),
        ],
      ),
    );
  }
}
