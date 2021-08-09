import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/establishment_model_lite.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/show_vet.dart';

class EstablishmentsController extends GetxController {
  final establishmentRepo = EstablishmentRepository();

  final _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxList<EstablecimientoModelLite> establecimientos =
      <EstablecimientoModelLite>[].obs;

  @override
  void onReady() {
    if (prefUser.tokenHas() && prefUser.vetDataHas()) {
      getAll();
    }
    super.onReady();
  }

  @override
  void refresh() => _refresh();
  Future<dynamic> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 2));
    getAll();
    return null;
  }

  void getAll() => _getAll();
  Future<void> _getAll() async {
    carga = true;
    establecimientos.clear();
    final lista = await establishmentRepo.getAll();
    establecimientos.addAll(lista);
    carga = false;
  }

  void deldete(String id) => _deldete(id);
  Future<void> _deldete(String id) async {
    await establishmentRepo.deleteEstablishmetn(id);
    getAll();
  }

  void go2Show(String id) => _go2Show(id);
  void _go2Show(String id) {
    Get.to(ShowVetMain(), arguments: id);
  }

  void favoriteVet(String? id, String? name, String? logo) {
    prefUser.vetDataDel();
    final VetStorage forStorage = VetStorage();
    forStorage.vetId = id;
    forStorage.vetName = name;
    forStorage.vetLogo = logo;

    prefUser.vetData = vetStorageToJson(forStorage);

    getAll();
  }

  void favoriteVetToInit(String? id, String? name, String? logo) {
    prefUser.vetDataDel();
    final VetStorage forStorage = VetStorage();
    forStorage.vetId = id;
    forStorage.vetName = name;
    forStorage.vetLogo = logo;

    prefUser.vetData = vetStorageToJson(forStorage);

    getAll();
    Get.offNamedUntil(NameRoutes.home, (route) => false);
  }
}
