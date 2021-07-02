import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';
import 'package:vet_app/src/offers/data/offersRepository.dart';

class OffersController extends GetxController {
  final _repo = OffersRepository();

  RxList<OfferModal> promociones = <OfferModal>[].obs;

  RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }

  getAll() => _getAll();

  _getAll() async {
    cargando = true;
    promociones.clear();
    var response = await _repo.getAll(prefUser.vetId!);
    promociones.addAll(response);
    cargando = false;
  }

  delete(String idOffer) => _delete(idOffer);

  _delete(String idOffer) async {
    await _repo.delete(prefUser.vetId!, idOffer);
    getAll();
  }
}
