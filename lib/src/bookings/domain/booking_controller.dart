import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/_pet/data/model/pet_client.dart';
import 'package:vet_app/src/_pet/data/pet_repository.dart';
import 'package:vet_app/src/bookings/data/booking_repository.dart';
import 'package:vet_app/src/bookings/data/model/_finalize_attention.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultation_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/deworming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/grooming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/others_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/testing_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/vaccination_booking.dart';
import 'package:vet_app/src/bookings/presentation/widgets/data_nextdate.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

class BookingController extends GetxController {
  final _repo = BookingRepository();
  final _repoPet = PetClientRepository();

  final _global = Get.find<GlobalController>();
  // final _repoCalendar = CalendarController();

  final _homeController = Get.find<HomeController>();
  final condicion = ''.obs;
  final statusBooking = false.obs;
  final listNextdate = <DataNextdate>[].obs;

  final petData = PetClient().obs;
  final loadingPage = true.obs;
  // final itemList = <String>[];

  final cirugia = Rxn<SurgeryBooking>();
  final consulta = Rxn<ConsultationBooking>();
  final desparasita = Rxn<DewormingBooking>();
  final grooming = Rxn<GroomingBooking>(); //grooming
  final examenes = Rxn<TestingBooking>();
  final otros = Rxn<OthersBooking>();
  final vacunas = Rxn<VaccinationBooking>();

  final montoTotal = 0.0.obs;

  final selected = 2.obs;
  final selectedTypeConsultation = 0.obs;

  String? attentionId;
  String? attentioAmount;

  final pesoController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  //consulta
  final listaDiagnostico = <Diagnosis>[].obs;
  final anamnesisBoolConsulta = false.obs;
  final recomendacionesBoolConsulta = false.obs;
  //grooming
  final listaGroomingsIds = <int>[].obs;
  final listaGroomingsNames = <String>[].obs;

  final listDeworming = <Dewormer>[].obs;
  final listOthers = <OtherServ>[].obs;
  final listTesting = <Test>[].obs;
  final listVaccines = <Vaccine>[].obs;

  final bookingId = ''.obs;
  final petId = ''.obs;
  // String? petId;

  void add2List(dynamic dato) {
    if (listNextdate.where((x) => x.type == dato['type']).isNotEmpty) {
      snackBarMessage(
        message: 'Ya tiene una próxima cita de este tipo',
      );
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
    }
  }

  @override
  void onClose() {
    if (Get.context!.width < 900) Get.close(1);
    bookingId.value = '';
    petId.value = '';
    super.onClose();
  }

  Future<void> initLoad() async {
    final general = await _repo.attend(prefUser.vetId!, bookingId.value);
    montoTotal.value = general.total;

    petData.value = await _repoPet.getPet(petId.value);
    loadingPage.value = false;

    _homeController.getAllBookings();

    attentionId = general.attentionId;
    cirugia.value = general.surgery;
    consulta.value = general.consultation;
    desparasita.value = general.deworming;
    grooming.value = general.grooming;
    examenes.value = general.testing;
    otros.value = general.other;
    vacunas.value = general.vaccination;
    //
    if (consulta.value != null) {
      switch (consulta.value!.type) {
        case 'Consulta':
          selectedTypeConsultation.value = 0;
          break;
        case 'Chequeo preventivo':
          selectedTypeConsultation.value = 1;
          break;
        case 'Tratamiento':
          selectedTypeConsultation.value = 2;
          break;
        default:
          selectedTypeConsultation.value = 0;
      }
    }

    if (grooming.value != null) {
      if (grooming.value?.groomingIds != null) {
        listaGroomingsIds.addAll(grooming.value!.groomingIds!);
        listaGroomingsNames.addAll(grooming.value!.groomings!);
      }
    }
    // carga listas
    listaDiagnostico.clear();
    listaDiagnostico.addAll(consulta.value?.diagnoses ?? []);
    listDeworming.clear();
    listDeworming.addAll(desparasita.value?.dewormers ?? []);
    listVaccines.clear();
    listVaccines.addAll(vacunas.value?.vaccines ?? []);
    listOthers.clear();
    listOthers.addAll(otros.value?.others ?? []);
    listTesting.clear();
    listTesting.addAll(examenes.value?.tests ?? []);
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

  Future<void> recorreDatosAtt() async {
    // montoTotal.value = 0;

    final general = await _repo.attend(prefUser.vetId!, bookingId.value);

    general.consultation?.amount ?? 0;
    general.deworming?.amount ?? 0;
    general.grooming?.amount ?? 0;
    general.other?.amount ?? 0;
    general.surgery?.amount ?? 0;
    general.testing?.amount ?? 0;
    general.vaccination?.amount ?? 0;

    montoTotal.value = general.total;
  }

  void saveConsulta(ConsultationBooking data) => _saveConsulta(data);
  Future<void> _saveConsulta(ConsultationBooking data) async {
    consulta.value = await _repo.saveConsultation(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Consulta',
    );

    Get.back();
  }

  void saveCirugia(SurgeryBooking data) => _saveCirugia(data);
  Future<void> _saveCirugia(SurgeryBooking data) async {
    cirugia.value = await _repo.saveSurgery(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Cirugía',
    );
    Get.back();
  }

  void saveDesparasitacion(DewormingBooking data) => _saveDesparasitacion(data);
  Future<void> _saveDesparasitacion(DewormingBooking data) async {
    desparasita.value = await _repo.saveDeworming(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Desparasitación',
    );
    Get.back();
  }

  void saveGrooming(GroomingBooking data) => _saveGrooming(data);
  Future<void> _saveGrooming(GroomingBooking data) async {
    grooming.value = await _repo.saveGrooming(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Grooming',
    );
    Get.back();
  }

  void saveVacuna(VaccinationBooking data) => _saveVacuna(data);
  Future<void> _saveVacuna(VaccinationBooking data) async {
    vacunas.value = await _repo.saveVaccination(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Vacuna',
    );
    Get.back();
  }

  void saveExamenes(TestingBooking data) => _saveExamenes(data);
  Future<void> _saveExamenes(TestingBooking data) async {
    examenes.value = await _repo.saveTesting(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Exámenes',
    );
    Get.back();
  }

  void saveOtro(OthersBooking data) => _saveOtro(data);
  Future<void> _saveOtro(OthersBooking data) async {
    otros.value = await _repo.saveOthers(
      prefUser.vetId!,
      attentionId!,
      data,
    );

    recorreDatosAtt();
    snackBarMessage(
      type: TypeSnackBar.SUCCESS,
      message: 'Se guardó Otros',
    );
    Get.back();
  }

  deleteConsulta() => deleteServicios('consultation');
  deleteCirugia() => deleteServicios('surgery');
  deleteDesparasita() => deleteServicios('deworming');
  deleteGrooming() => deleteServicios('grooming');
  deleteVacuna() => deleteServicios('vaccination');
  deleteExamen() => deleteServicios('testing');
  deleteOtros() => deleteServicios('other');

  deleteServicios(String type) async {
    await _repo.deleteServiceAttention(prefUser.vetId!, attentionId!, type);
    recorreDatosAtt();

    switch (type) {
      case 'consultation':
        {
          consulta.value = null;
          listaDiagnostico.clear();
        }
        break;
      case 'surgery':
        {
          cirugia.value = null;
        }
        break;
      case 'deworming':
        {
          desparasita.value = null;
          listDeworming.clear();
        }
        break;
      case 'grooming':
        {
          grooming.value = null;
          listaGroomingsIds.clear();
          listaGroomingsNames.clear();
        }

        break;
      case 'vaccination':
        {
          vacunas.value = null;
          listVaccines.clear();
        }
        break;
      case 'testing':
        {
          examenes.value = null;
          listTesting.clear();
        }
        break;
      case 'other':
        {
          otros.value = null;
          listOthers.clear();
        }
        break;
      default:
        null;
    }
  }

  void saveFinalize() => _saveFinalize();
  Future<void> _saveFinalize() async {
    List<String> condition = [
      'thin',
      'underweight',
      'ideal',
      'overweight',
      'obese'
    ];
    final FinalizeAttention tempFinalize = FinalizeAttention();

    tempFinalize.weight = pesoController.numberValue;
    tempFinalize.bodyCondition = condition[selected.value];

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

    if (montoTotal.value == 0 || pesoController.numberValue == 0) {
      if (pesoController.numberValue == 0) {
        snackBarMessage(
          message: 'Debe registrar el peso',
        );
        return;
      } else if (montoTotal.value == 0) {
        snackBarMessage(
          message: 'Debe registrar servicio',
        );
        return;
      }
    } else {
      final dataResponse = await _repo.finalizeAttention(
        prefUser.vetId!,
        attentionId!,
        tempFinalize,
      );

      if (dataResponse['result'] == false) {
        snackBarMessage(
          type: TypeSnackBar.ERROR,
          message: 'Oops! ocurrió un error',
        );
      } else {
        _global.generalLoad();
        snackBarMessage(
          type: TypeSnackBar.SUCCESS,
          message: 'Atencion finalizada',
        );
        Get.back();
      }
    }
  }
}
