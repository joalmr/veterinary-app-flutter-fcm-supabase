import 'package:get_storage/get_storage.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  get userRol => box.read('rolUser') ?? '';
  set userRol(String value) => box.write('rolUser', value);
  userRolHas() => box.hasData('rolUser');
  userRolDel() => box.remove('rolUser');

  //token app
  get logged => box.read('logged') ?? '';
  set logged(String value) => box.write('logged', value);
  loggedHas() => box.hasData('logged');
  loggedDel() => box.remove('logged');

  //id temporal vet
  get vetId => box.read('idVet') ?? '';
  set vetId(String value) => box.write('idVet', value);
  vetIdHas() => box.hasData('idVet');
  vetIdDel() => box.remove('idVet');

  ///name temporal vet
  get vetName => box.read('nameVet') ?? '';
  set vetName(String value) => box.write('nameVet', value);
  vetNameHas() => box.hasData('nameVet');
  vetNameDel() => box.remove('nameVet');

  ///name temporal vet
  get vetLogo => box.read('logoVet') ?? '';
  set vetLogo(String value) => box.write('logoVet', value);
  vetLogoHas() => box.hasData('logoVet');
  vetLogoDel() => box.remove('logoVet');
}
