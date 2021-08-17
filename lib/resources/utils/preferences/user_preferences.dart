import 'package:get_storage/get_storage.dart';

import 'preferences_model.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  bool get hasMenu => box.read('hasMenu');
  set hasMenu(bool value) => box.write('hasMenu', value);

  String get userRol => box.read('userRol') ?? '';
  set userRol(String value) => box.write('userRol', value);
  bool userRolHas() => box.hasData('userRol');
  Future<void> userRolDel() => box.remove('userRol');

  //token app
  String get token => box.read('token') ?? '';
  set token(String value) => box.write('token', value);
  bool tokenHas() => box.hasData('token');
  Future<void> tokenDel() => box.remove('token');

  // id temporal vet
  String get vetData => box.read('vetData') ?? '';
  set vetData(String value) => box.write('vetData', value);
  bool vetDataHas() => box.hasData('vetData');
  Future<void> vetDataDel() => box.remove('vetData');

  String? get vetId => vetStorageFromJson(vetData).vetId;
  String? get vetName => vetStorageFromJson(vetData).vetName;
  String? get vetLogo => vetStorageFromJson(vetData).vetLogo;
}
