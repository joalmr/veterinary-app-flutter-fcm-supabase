import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';
import 'package:vet_app/src/home/domain/values/homeValue.dart';

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

  Future<Null> _refreshUnconfirmed() async {
    v.carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  getAll() => _getAll();

  Future<List<ReservaModel>> _getAll() async {
    print('entra getall bookings');

    v.reservas.clear();
    var misReservas = await bookingService.getAll(prefUser.vetId);
    v.reservas.addAll(misReservas);

    getVet();
    v.carga = false;

    print('fin getall bookings');
    return v.reservas;
  }

  getVet() => _getVet();

  Future<void> _getVet() async {
    final veterinary = await stablishmentService.getById(prefUser.vetId);
    v.nameVet = veterinary.name;
  }

  confirm(idBooking) => _confirm(idBooking);

  Future<void> _confirm(idBooking) async {
    v.carga = true;
    int resp = await bookingService.confirm(idBooking);

    if (resp == 200) getAll();

    v.cargaConfirmar = false;
  }
}
