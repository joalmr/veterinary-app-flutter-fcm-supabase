import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/offers/data/model/offer_model.dart';
import 'package:vet_app/src/offers/data/offers_repository.dart';

class OffersController extends GetxController {
  final _repo = OffersRepository();

  RxList<OfferModal> promociones = <OfferModal>[].obs;

  final RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  getAll() => _getAll();

  _getAll() async {
    cargando = true;
    promociones.clear();
    final response = await _repo.getAll(prefUser.vetId!);
    promociones.addAll(response);
    cargando = false;
  }

  delete(String idOffer) => _delete(idOffer);

  _delete(String idOffer) async {
    await _repo.delete(prefUser.vetId!, idOffer);
    getAll();
  }
}
