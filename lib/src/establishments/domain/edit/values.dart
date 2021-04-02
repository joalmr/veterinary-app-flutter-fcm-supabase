part of 'editVetController.dart';

class EditVetValue {
  final establishmentRepo = EstablishmentRepository();

  final EstablishmentsController establishmentController = Get.find();

  var establishment = new EstablishmentModal().obs;

  RxBool _cargaById = false.obs;
  bool get cargaById => _cargaById.value;
  set cargaById(bool value) => _cargaById.value = value;
}
