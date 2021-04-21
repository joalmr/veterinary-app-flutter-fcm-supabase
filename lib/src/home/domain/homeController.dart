import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import 'package:vet_app/src/home/data/model/reservaModel.dart';

class HomeController extends GetxController {
  final establishmentService = EstablishmentRepository();
  final bookingService = BookingRepository();

  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxBool _cargaConfirmar = false.obs;
  bool get cargaConfirmar => _cargaConfirmar.value;
  set cargaConfirmar(bool value) => _cargaConfirmar.value = value;

  RxString _nameVet = "".obs;

  String get nameVet => _nameVet.value;
  set nameVet(String value) => _nameVet.value = value;

  RxList<ReservaModel> reservas = <ReservaModel>[].obs;

////////////////////////////////////////////////////////////////////////////////

  @override
  void onInit() {
    carga = true;
    print(prefUser.vetId);
    getAll();
    super.onInit();
  }

  refreshUnconfirmed() => _refreshUnconfirmed();

  Future<Null> _refreshUnconfirmed() async {
    carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  getAll() => _getAll();

  Future<List<ReservaModel>> _getAll() async {
    reservas.clear();
    var misReservas = await bookingService.getAll(prefUser.vetId);
    reservas.addAll(misReservas);

    getVet();
    carga = false;

    return reservas;
  }

  getVet() => _getVet();

  Future<void> _getVet() async {
    final veterinary = await establishmentService.getById(prefUser.vetId);
    nameVet = veterinary.name;
  }

  confirm(idBooking) => _confirm(idBooking);

  Future<void> _confirm(idBooking) async {
    carga = true;
    int resp = await bookingService.confirm(idBooking);
    if (resp == 200) getAll();
    cargaConfirmar = false;
  }
}
