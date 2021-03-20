import 'package:get/get.dart';

class CreateVetValue {
  RxBool _checked = false.obs;
  bool get checked => _checked.value;
  set checked(bool value) => _checked.value = value;

  RxString _idVet = ''.obs;
  String get idVet => _idVet.value;
  set idVet(String value) => _idVet.value = value;

  RxInt _selected = 1.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected.value = value;
}
