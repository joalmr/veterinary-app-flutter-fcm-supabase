import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';
import 'package:vet_app/src/offers/data/offersRepository.dart';

class OffersController extends GetxController {
  final _repo = OffersRepository();

  RxList<OfferModal> promociones = <OfferModal>[].obs;

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
    promociones.clear();
    var response = await _repo.getAll(prefUser.vetId);
    promociones.addAll(response);
  }

  delete(String idOffer) => _delete(idOffer);

  _delete(String idOffer) async {
    await _repo.delete(prefUser.vetId, idOffer);
    getAll();
  }
}
