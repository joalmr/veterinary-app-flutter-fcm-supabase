import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/registros/data/attentionsRepository.dart';
import 'package:vet_app/src/registros/data/model/attentionRegModel.dart';
import 'package:vet_app/src/registros/data/model/filterAttention.dart';

class AttentionsController extends GetxController {
  final _repo = AttentionRepository();
  final listaReg = <AttentionReg>[].obs;

  final from =
      formatDateBasic(DateTime.now().subtract(const Duration(days: 60))).obs;

  final to = formatDateBasic(DateTime.now()).obs;

  final userName = ''.obs;
  final petName = ''.obs;
  RxList<int> specie = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAll();
  }

  getAll() => _getAll();
  _getAll() async {
    final temp = FilterAttention(
      from: from.value,
      to: to.value,
      userName: userName.value.trim() == '' ? null : userName.value,
      petName: petName.value.trim() == '' ? null : petName.value,
      petSpecie: specie,
    );
    final response = await _repo.getAll(
      prefUser.vetId!,
      temp,
    );
    listaReg.clear();
    listaReg.addAll(response.result!);
  }
}
