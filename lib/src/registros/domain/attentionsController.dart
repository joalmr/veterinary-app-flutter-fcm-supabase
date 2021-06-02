import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/registros/data/attentionsRepository.dart';
import 'package:vet_app/src/registros/data/model/attentionRegModel.dart';

class AttentionsController extends GetxController {
  final _repo = AttentionRepository();
  var listaReg = <AttentionReg>[].obs;

  RxString from = formatDateBasic(DateTime.now().subtract(Duration(days: 15))).obs;
  RxString to = formatDateBasic(DateTime.now()).obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAll()=>_getAll();
  _getAll() async {
    listaReg.clear();
    final response = await _repo.getAll(prefUser.vetId, from.value, to.value);
    listaReg.addAll(response.result);
  }
}
