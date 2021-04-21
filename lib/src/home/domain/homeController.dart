import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';

class HomeController extends GetxController {
  final establishmentService = EstablishmentRepository();
  final _repoBooking = BookingRepository();

  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxBool _cargaConfirmar = false.obs;
  bool get cargaConfirmar => _cargaConfirmar.value;
  set cargaConfirmar(bool value) => _cargaConfirmar.value = value;

  RxString _nameVet = "".obs;

  String get nameVet => _nameVet.value;
  set nameVet(String value) => _nameVet.value = value;

  // RxList<ReservaModel> reservas = <ReservaModel>[].obs;

  RxList<Booking> unconfirmed = <Booking>[].obs;
  RxList<Booking> overdue = <Booking>[].obs;
  RxList<Booking> today = <Booking>[].obs;
  RxList<Booking> incoming = <Booking>[].obs;

////////////////////////////////////////////////////////////////////////////////

  @override
  void onInit() {
    carga = true;
    print(prefUser.vetId);
    getUnconfirmed();
    getVet();
    super.onInit();
  }

  refreshUnconfirmed() => _refreshUnconfirmed();

  Future<Null> _refreshUnconfirmed() async {
    carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getUnconfirmed();
    return null;
  }

  getVet() {
    nameVet = prefUser.vetName;
  }

  //!   listas bookings
  //
  getUnconfirmed() => _getUnconfirmed();
  _getUnconfirmed() async {
    final response = await _repoBooking.getUnconfirmed(prefUser.vetId);
    unconfirmed.clear();
    unconfirmed.addAll(response.result);
    carga = false;
  }

  getOverdue() => _getOverdue();
  _getOverdue() async {
    final response = await _repoBooking.getOverdue(prefUser.vetId);
    overdue.clear();
    overdue.addAll(response.result);
  }

  getToday() => _getToday();
  _getToday() async {
    final response = await _repoBooking.getToday(prefUser.vetId);
    today.clear();
    today.addAll(response.result);
  }

  getIncoming() => _getIncoming();
  _getIncoming() async {
    final response = await _repoBooking.getIncoming(prefUser.vetId);
    incoming.clear();
    incoming.addAll(response.result);
  }

  getAllBookings() {
    getUnconfirmed();
    getToday();
    getIncoming();
    getOverdue();
  }

  //!   confirmar
  //
  confirm(idBooking) => _confirm(idBooking);
  Future<void> _confirm(idBooking) async {
    carga = true;
    int resp = await _repoBooking.confirm(idBooking);
    if (resp == 200) {
      getAllBookings();
    }
    cargaConfirmar = false;
  }
}
