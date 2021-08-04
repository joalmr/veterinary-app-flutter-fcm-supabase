import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'package:vet_app/src/userClients/data/clients_repository.dart';
import 'package:vet_app/src/userClients/data/model/client_user_model.dart';
import 'package:vet_app/src/userClients/data/model/clients_model.dart';
import 'package:vet_app/src/userClients/data/model/find_user_model.dart';
import 'package:vet_app/src/userClients/data/model/request/pet.dart';
import 'package:vet_app/src/userClients/presentation/app/clientes/client_view.dart';

class ClientsController extends GetxController {
  final _repo = ClientsRepository();
  final _home = Get.find<HomeController>();

  final loadClients = true.obs;

  final myClients = <ResultClients>[].obs;
  final findClient = Rxn<ResultFindUser>();
  final resultUserClient = Rxn<ResultUserClient>();

  final loadUserPets = true.obs;
  final userId = ''.obs;
  final typeId = <int>[].obs;
  final bookingAt = formatYMDHms(DateTime.now()).obs;

  // final userData = ResultFindUser().obs;

  final fecha = ''.obs;
  final hora = ''.obs;

  final programaAtencion = false.obs;
  final btnAtencion = true.obs;

  @override
  void onReady() {
    getClients();
    super.onReady();
  }

  getClients() async {
    if (prefUser.tokenHas() && prefUser.vetDataHas()) {
      loadClients.value = true;
      final response = await _repo.getMyCLients(prefUser.vetId!);

      myClients.clear();
      myClients.addAll(response.result!);

      loadClients.value = false;
    }
  }

  findClients(String mailUser) async {
    final response = await _repo.findUser(mailUser);
    findClient.value = response.result!;
  }

  goToUser(String user) async {
    userId.value = user;
    await getUserComplete();
    Get.to(ClienteVista());
  }

  getUserComplete() async {
    loadUserPets.value = true;

    final responseClient = await _repo.getUserClient(
      prefUser.vetId!,
      userId.value,
    );

    resultUserClient.value = responseClient.result;
    loadUserPets.value = false;
  }

  createBookingNow(String petId) async {
    btnAtencion.value = false;
    typeId.add(1);
    bookingAt.value = formatYMDHms(DateTime.now());
    await _createBooking(petId);
    programaAtencion.value = false;
    btnAtencion.value = true;
    Get.toNamed(NameRoutes.home);
  }

  createBookingLate(String petId) async {
    btnAtencion.value = false;
    //! TODO: FALTA AGREGAS LISTA DE TYPES
    typeId.add(1);
    typeId.add(2);
    typeId.add(3);

    if (fecha.value.isEmpty || hora.value.isEmpty) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Oops! Seleccione fecha u hora',
          style: TextStyle(color: colorRed),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
    } else {
      bookingAt.value = '${fecha.value} ${hora.value}:00';
      await _createBooking(petId);
      programaAtencion.value = false;
      btnAtencion.value = true;
      Get.back();
    }
  }

  _createBooking(String petId) async {
    await _repo.createBooking(
      prefUser.vetId!,
      bookingAt.value,
      petId,
      typeId,
      userId.value,
    );
    typeId.clear();
    _home.getAllBookings();
    // bookingAt.value = '';
  }

  addPet(PetModelReq addpet) async {
    final response = await _repo.insertPet(addpet);
    print(response);
    getUserComplete();
    Get.back();
  }
}
