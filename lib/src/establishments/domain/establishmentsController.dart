import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/preferences/preferencesModel.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmentModelLite.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/showVet.dart';
import 'package:vet_app/src/home/presentation/pages/home.dart';

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

  @override
  void onClose() {
    super.onClose();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  getAll() => _getAll();

  _getAll() async {
    carga = true;
    final lista = await establishmentRepo.getAll();
    establecimientos.clear();
    establecimientos.addAll(lista);
    print('fin getAll');
    carga = false;
  }

  deldete(String id) => _deldete(id);

  _deldete(String id) async {
    await establishmentRepo.deleteEstablishmetn(id);
    getAll();
  }

  go2Show(String id) => _go2Show(id);

  _go2Show(String id) {
    Get.to(ShowVetMain(), arguments: id);
  }

  favoriteVet(id, name, logo) {
    prefUser.vetDataDel();

    VetStorage forStorage = VetStorage();
    forStorage.vetId = id;
    forStorage.vetName = name;
    forStorage.vetLogo = logo;

    prefUser.vetData = vetStorageToJson(forStorage);

    getAll();
  }

  favoriteVetToInit(id, name, logo) {
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
