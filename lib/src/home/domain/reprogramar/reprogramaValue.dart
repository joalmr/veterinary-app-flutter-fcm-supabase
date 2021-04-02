import 'package:get/get.dart';

class ReprogramaValue {
  RxBool _reprogramando = false.obs;
  bool get reprogramando => _reprogramando.value;
  set reprogramando(bool value) => _reprogramando.value = value;

  RxBool _reprogramaBlock = false.obs;
  bool get reprogramaBlock => _reprogramaBlock.value;
  set reprogramaBlock(bool value) => _reprogramaBlock.value = value;

  RxBool _errorDateTime = false.obs;
  bool get errorDateTime => _errorDateTime.value;
  set errorDateTime(bool value) => _errorDateTime.value = value;

  RxString _fecha = "".obs;
  String get fecha => _fecha.value;
  set fecha(String value) => _fecha.value = value;

  RxString _hora = "".obs;
  String get hora => _hora.value;
  set hora(String value) => _hora.value = value;

  RxString _msgfecha = "".obs;
  String get msgfecha => _msgfecha.value;
  set msgfecha(String value) => _msgfecha.value = value;

  RxString _msghora = "".obs;
  String get msghora => _msghora.value;
  set msghora(String value) => _msghora.value = value;
}
