import 'dart:convert';
import 'package:get/get.dart';
import 'package:vet_app/_supabase/services/auth/petlover.repo.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';
import 'package:vet_app/src/user_clients/data/clients_repository.dart';
import 'package:vet_app/src/user_clients/data/model/breed_model.dart';
import 'package:vet_app/src/user_clients/data/model/client_user_model.dart';
import 'package:vet_app/src/user_clients/data/model/clients_model.dart';
import 'package:vet_app/src/user_clients/data/model/find_user_model.dart';
import 'package:vet_app/src/user_clients/data/model/request/pet.dart';
import 'package:vet_app/src/user_clients/data/model/request/petlover.dart';
import 'package:vet_app/src/user_clients/presentation/app/clientes/client_view.dart';

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

  final userIdSupabase = 0.obs;

  final razas = <Breed>[].obs;

  // final userData = ResultFindUser().obs;

  final fecha = ''.obs;
  final hora = ''.obs;

  final programaAtencion = false.obs;
  final btnAtencion = true.obs;

  Breed? razaSeleccionada;

  @override
  void onInit() {
    if (prefUser.tokenHas() &&
        prefUser.vetDataHas() &&
        prefUser.vetIdSupaHas()) {
      getClients();
    }

    super.onInit();
  }

  getClients() async {
    loadClients.value = true;
    final response = await _repo.getMyCLients(prefUser.vetId!);

    myClients.clear();
    myClients.addAll(response.result!);

    await getBreeds(1);
    razaSeleccionada = razas.first;

    loadClients.value = false;
  }

  findClients(String mailUser) async {
    final response = await _repo.findUser(mailUser);
    findClient.value = response?.result; //TODO: revisando
    userIdSupabase.value = await PetloverRepo().getPetlover(
      findClient.value!.id!,
      findClient.value!.name!,
      findClient.value!.lastname!,
    );
  }

  goToUser(String user) async {
    userId.value = user; //uuid

    await getUserComplete();

    Get.to(ClienteVista());
  }

  getUserComplete() async {
    loadUserPets.value = true;

    final responseClient = await _repo.getUserClient(
      prefUser.vetId!,
      userId.value,
    );

    userIdSupabase.value = await PetloverRepo().getPetlover(
      userId.value,
      responseClient.result!.user!.name!,
      responseClient.result!.user!.lastname!,
    );

    //TODO: cargar venta

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
    //! TODO: FALTA AGREGAR LISTA DE TYPES
    typeId.add(1);

    if (fecha.value.isEmpty || hora.value.isEmpty) {
      snackBarMessage(
        type: TypeSnackBarName.ERROR,
        message: 'Oops! Seleccione fecha u hora',
      );
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
  }

  addPet(PetModelReq addpet) async {
    await _repo.insertPet(addpet);

    getUserComplete();
    Get.back();
  }

  getBreeds(int specie) async {
    final response = await _repo.getBreeds(specie);

    razas.clear();
    razas.addAll(response);
  }

  Future<List<Breed>> getDataRaza(String filter) async {
    List<Breed> lista = <Breed>[];
    for (var element in razas) {
      var palabra = element.name;
      bool contiene = palabra!.toLowerCase().contains(filter.toLowerCase());
      if (contiene) {
        lista.add(element);
      }
    }

    var models = lista;
    return models;
  }

  addPetlover(CreatePetloverReq addpetlover) async {
    final response = await _repo.insertPetlover(addpetlover, prefUser.vetId!);

    final responseJson = jsonDecode(response);

    if (responseJson['result'] == false) {
      snackBarMessage(
        type: TypeSnackBarName.ERROR,
        message: responseJson['message'],
      );
    } else {
      await getClients();
      Get.back();
    }
  }
}
