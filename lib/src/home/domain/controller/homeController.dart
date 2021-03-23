import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';
import 'package:vet_app/src/home/domain/values/homeValue.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';

class HomeController extends GetxController {
  final EstablishmentRepository stablishmentService;
  final BookingRepository bookingService;

  HomeController({
    @required this.stablishmentService,
    @required this.bookingService,
  });

  final v = HomeValue();

////////////////////////////////////////////////////////////////////////////////

  @override
  void onInit() {
    // initHome();
    v.carga = true;
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  refreshUnconfirmed() => _refreshUnconfirmed();
  getAll() => getTodos();
  getVet() => getPorId();
  confirm(idBooking) => setConfirmar(idBooking);

  Future<Null> _refreshUnconfirmed() async {
    v.carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  Future<List<ReservaModel>> getTodos() async {
    print('entra getall');

    v.reservas.clear();
    var misReservas = await bookingService.getAll(prefUser.vetId);
    v.reservas.addAll(misReservas);

    getVet();
    v.carga = false;

    print('fin getall');
    return v.reservas;
  }

  Future<void> getPorId() async {
    final veterinary = await stablishmentService.getById(prefUser.vetId);
    v.nameVet = veterinary.name;
  }

  Future<void> setConfirmar(idBooking) async {
    v.carga = true;
    int resp = await bookingService.confirm(idBooking);

    if (resp == 200) getAll();

    v.cargaConfirmar = false;
  }
}
