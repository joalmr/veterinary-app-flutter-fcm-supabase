import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/offers/data/offersRepository.dart';

class OffersController extends GetxController {
  final _repo = OffersRepository();

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

  _getAll() {
    _repo.getAll(prefUser.vetId);
  }
}
