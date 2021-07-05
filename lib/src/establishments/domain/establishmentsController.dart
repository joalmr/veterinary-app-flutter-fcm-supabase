import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmentModelLite.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/showVet.dart';

class EstablishmentsController extends GetxController {
  final establishmentRepo = EstablishmentRepository();

  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxList<EstablecimientoModelLite> establecimientos =
      <EstablecimientoModelLite>[].obs;

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    // getAll();
    super.onReady();
  }

  void refresh() => _refresh();
  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  void getAll() => _getAll();
  _getAll() async {
    carga = true;
    establecimientos.clear();
    final lista = await establishmentRepo.getAll();
    establecimientos.addAll(lista);
    carga = false;
  }

  void deldete(String id) => _deldete(id);
  _deldete(String id) async {
    await establishmentRepo.deleteEstablishmetn(id);
    getAll();
  }

  void go2Show(String id) => _go2Show(id);
  _go2Show(String id) {
    Get.to(ShowVetMain(), arguments: id);
  }

  void favoriteVet(id, name, logo) {
    prefUser.vetDataDel();
    VetStorage forStorage = VetStorage();
    forStorage.vetId = id;
    forStorage.vetName = name;
    forStorage.vetLogo = logo;

    prefUser.vetData = vetStorageToJson(forStorage);

    getAll();
  }

  void favoriteVetToInit(id, name, logo) {
    prefUser.vetDataDel();
    VetStorage forStorage = VetStorage();
    forStorage.vetId = id;
    forStorage.vetName = name;
    forStorage.vetLogo = logo;

    prefUser.vetData = vetStorageToJson(forStorage);

    getAll();
    Get.offNamedUntil(NameRoutes.home, (route) => false);
  }
}
