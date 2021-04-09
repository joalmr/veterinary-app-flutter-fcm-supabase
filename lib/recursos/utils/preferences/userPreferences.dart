import 'package:get_storage/get_storage.dart';

import 'preferencesModel.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  get userRol => box.read('userRol') ?? '';
  set userRol(String value) => box.write('userRol', value);
  userRolHas() => box.hasData('userRol');
  userRolDel() => box.remove('userRol');

  //token app
  get token => box.read('token') ?? '';
  set token(String value) => box.write('token', value);
  tokenHas() => box.hasData('token');
  tokenDel() => box.remove('token');

  // id temporal vet
  get vetData => box.read('vetData') ?? '';
  set vetData(String value) => box.write('vetData', value);
  vetDataHas() => box.hasData('vetData');
  vetDataDel() => box.remove('vetData');

  get vetId => vetStorageFromJson(vetData).vetId;
  get vetName => vetStorageFromJson(vetData).vetName;
  get vetLogo => vetStorageFromJson(vetData).vetLogo;

  // // //id temporal vet
  // // get vetId => box.read('idVet') ?? '';
  // // set vetId(String value) => box.write('idVet', value);
  // // vetIdHas() => box.hasData('idVet');
  // // vetIdDel() => box.remove('idVet');

  // // ///name temporal vet
  // // get vetName => box.read('nameVet') ?? '';
  // // set vetName(String value) => box.write('nameVet', value);
  // // vetNameHas() => box.hasData('nameVet');
  // // vetNameDel() => box.remove('nameVet');

  // // ///name temporal vet
  // // get vetLogo => box.read('logoVet') ?? '';
  // // set vetLogo(String value) => box.write('logoVet', value);
  // // vetLogoHas() => box.hasData('logoVet');
  // // vetLogoDel() => box.remove('logoVet');
}
