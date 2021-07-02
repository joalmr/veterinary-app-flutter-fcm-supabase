import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/bookings/data/bookingRepository.dart';
import 'package:vet_app/src/bookings/data/model/bookingModel.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';


class HomeController extends GetxController {
  final establishmentService = EstablishmentRepository();
  final _repoBooking = BookingRepository();

  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxBool _cargaConfirmar = false.obs;
  bool get cargaConfirmar => _cargaConfirmar.value;
  set cargaConfirmar(bool value) => _cargaConfirmar.value = value;

  RxString nameVet = "".obs;

  RxList<Booking> unconfirmed = <Booking>[].obs;
  RxList<Booking> overdue = <Booking>[].obs;
  RxList<Booking> today = <Booking>[].obs;
  RxList<Booking> incoming = <Booking>[].obs;

////////////////////////////////////////////////////////////////////////////////

  @override
  void onInit() {
    getVet();
    getAllBookings();
    super.onInit();
  }

  launchWhatsApp(String phone, String user, String petName, String date, String time) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+51$phone',
      text: "Hola $user somos de ${prefUser.vetName}, nos comunicamos por la reserva de $petName\nFecha: $date\nHora: $time",
    );
    await launch('$link');
  }

  refreshUnconfirmed() => _refreshUnconfirmed();

  Future<Null> _refreshUnconfirmed() async {
    carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getUnconfirmed();
    return null;
  }

  getVet() {
    nameVet.value = prefUser.vetName!;
  }

  //!   listas bookings
  //
  getUnconfirmed() => _getUnconfirmed();
  _getUnconfirmed() async {
    unconfirmed.clear();
    final response = await _repoBooking.getUnconfirmed(prefUser.vetId!);
    unconfirmed.addAll(response.result!);
  }

  getOverdue() => _getOverdue();
  _getOverdue() async {
    overdue.clear();
    final response = await _repoBooking.getOverdue(prefUser.vetId!);
    overdue.addAll(response.result!);
  }

  getToday() => _getToday();
  _getToday() async {
    today.clear();
    final response = await _repoBooking.getToday(prefUser.vetId!);
    today.addAll(response.result!);
  }

  getIncoming() => _getIncoming();
  _getIncoming() async {
    incoming.clear();
    final response = await _repoBooking.getIncoming(prefUser.vetId!);
    incoming.addAll(response.result!);
  }

  getAllBookings() => _getAllBookings();
  _getAllBookings() async {
    carga = true;
    await getUnconfirmed();
    await getToday();
    await getIncoming();
    await getOverdue();
    carga = false;
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
