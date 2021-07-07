import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/_pet/data/pet_repository.dart';
import 'package:vet_app/src/_pet/model/pet_client.dart';
import 'package:vet_app/src/bookings/data/booking_repository.dart';
import 'package:vet_app/src/bookings/data/model/_finalize_attention.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultation_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/deworming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/others_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/testing_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/vaccination_booking.dart';
import 'package:vet_app/src/bookings/presentation/widgets/data_nextdate.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

class BookingController extends GetxController {
  final _repo = BookingRepository();
  final _repoPet = PetClientRepository();
  final _homeController = Get.find<HomeController>();
  RxString condicion = ''.obs;
  RxBool statusBooking = false.obs;
  RxList<DataNextdate> listNextdate = <DataNextdate>[].obs;

  String? bookingId;
  String? petId;
  String? specie;
  String? breed;
  String? name;
  String? image;
  String? birthday;

  final petData = PetClient().obs;

  final cirugia = Rxn<SurgeryBooking>();
  final consulta = Rxn<ConsultationBooking>();
  final desparasita = Rxn<DewormingBooking>();
  final examenes = Rxn<TestingBooking>();
  final otros = Rxn<OthersBooking>();
  final vacunas = Rxn<VaccinationBooking>();

  String? attentionId;
  String? attentioAmount;

  final pesoController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final listaDiagnostico = <Diagnosis>[].obs;
  final anamnesisBoolConsulta = false.obs;
  final recomendacionesBoolConsulta = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    bookingId = Get.arguments['bookingId'];
    petId = Get.arguments['petId'];
    specie = Get.arguments['specie'];
    breed = Get.arguments['breed'];
    name = Get.arguments['name'];
    image = Get.arguments['image'];
    birthday = Get.arguments['birthday'];
    //
    final general = await _repo.attend(prefUser.vetId!, bookingId!);
    print(jsonEncode(general));

    // final data = await _repoPet.getPet();
    print(' -> pet client');
    // print(jsonEncode(data));
    // print(jsonEncode(general));

    _homeController.getAllBookings();

    attentionId = general.attentionId;
    cirugia.value = general.surgery;
    consulta.value = general.consultation;
    desparasita.value = general.deworming;
    examenes.value = general.testing as TestingBooking?;
    otros.value = general.other;
    vacunas.value = general.vaccination;
  }

  @override
  void onClose() {
    if (Get.context!.width < 900) Get.close(1);
    super.onClose();
  }

  void saveConsulta(ConsultationBooking data) => _saveConsulta(data);
  Future<void> _saveConsulta(ConsultationBooking data) async {
    //actualiza dato
    consulta.value =
        await _repo.saveConsultation(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Consulta',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveCirugia(SurgeryBooking data) => _saveCirugia(data);
  Future<void> _saveCirugia(SurgeryBooking data) async {
    //actualiza dato
    cirugia.value =
        await _repo.saveSurgery(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Cirugía',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveDesparasitacion(DewormingBooking data) => _saveDesparasitacion(data);
  Future<void> _saveDesparasitacion(DewormingBooking data) async {
    //actualiza dato
    desparasita.value =
        await _repo.saveDeworming(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Desparasitación',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveVacuna(VaccinationBooking data) => _saveVacuna(data);
  Future<void> _saveVacuna(VaccinationBooking data) async {
    //actualiza dato
    vacunas.value =
        await _repo.saveVaccination(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Vacuna',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveGrooming() => _saveGrooming();
  Future<void> _saveGrooming() async {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Grooming',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveExamenes(TestingBooking data) => _saveExamenes(data);
  Future<void> _saveExamenes(TestingBooking data) async {
    //actualiza dato
    examenes.value =
        await _repo.saveTesting(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Exámenes',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void saveOtro(OthersBooking data) => _saveOtro(data);
  Future<void> _saveOtro(OthersBooking data) async {
    //actualiza dato
    otros.value = await _repo.saveOthers(prefUser.vetId!, attentionId!, data);

    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: const Text(
        'Se guardó Otros',
        style: TextStyle(color: colorMain),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black.withOpacity(0.85),
    ));
    Get.back();
  }

  void add2List(dynamic dato) {
    if (listNextdate.where((x) => x.type == dato['type']).isNotEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text('Ya tiene una próxima cita de este tipo'),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      Get.back();
    } else {
      final temp = DataNextdate(
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
        title: const Text('Eliminar'),
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

  void saveFinalize() => _saveFinalize();
  Future<void> _saveFinalize() async {
    // final general = await _repo.attend(prefUser.vetId, bookingId);
    // print(general.total);

    final FinalizeAttention tempFinalize = FinalizeAttention();

    tempFinalize.weight = pesoController.numberValue;
    tempFinalize.bodyCondition = 'overweight';

    for (final element in listNextdate) {
      switch (element.type) {
        case 'consultation':
          {
            tempFinalize.consultationNotificationNextdate = element.date;
            tempFinalize.consultationNotificationReason = element.name;
            tempFinalize.consultationNotificationObservation =
                element.observation;
          }
          break;
        case 'deworming':
          {
            tempFinalize.dewormingNotificationNextdate = element.date;
            tempFinalize.dewormingNotificationReason = element.name;
            tempFinalize.dewormingNotificationObservation = element.observation;
          }
          break;
        case 'grooming':
          {
            tempFinalize.groomingNotificationNextdate = element.date;
            tempFinalize.groomingNotificationReason = element.name;
            tempFinalize.groomingNotificationObservation = element.observation;
          }
          break;
        case 'vaccination':
          {
            tempFinalize.vaccinationNotificationNextdate = element.date;
            tempFinalize.vaccinationNotificationReason = element.name;
            tempFinalize.vaccinationNotificationObservation =
                element.observation;
          }
          break;
        default:
          {
            tempFinalize.consultationNotificationNextdate = element.date;
            tempFinalize.consultationNotificationReason = element.name;
            tempFinalize.consultationNotificationObservation =
                element.observation;
          }
          break;
      }
    }

    if (pesoController.numberValue == 0) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Debe registrar el peso',
          style: TextStyle(color: colorRed),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      return;
    } else if (listNextdate.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Debe registrar un servicio de atención',
          style: TextStyle(color: colorRed),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      return;
    } else {
      _repo.finalizeAttention(prefUser.vetId!, attentionId!, tempFinalize);

      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Atencion finalizada',
          style: TextStyle(color: colorMain),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
      Get.back();
    }
  }
}
