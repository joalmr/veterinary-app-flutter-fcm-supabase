import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/attentions/data/attentionsRepository.dart';
import 'package:vet_app/src/attentions/data/model/attentionRegModel.dart';

class AttentionsController extends GetxController {
  final _repo = AttentionRepository();
  var listaReg = <AttentionReg>[].obs;

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
    final response = await _repo.getAll(prefUser.vetId);
    listaReg.addAll(response.result);
  }
}
