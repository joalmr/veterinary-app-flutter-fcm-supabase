import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/assets/utils/headerHttp.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/stablishments/data/model/establishmentModel.dart';
import 'package:vet_app/src/stablishments/data/establishmentEntity.dart';

import 'establishmentInterface.dart';

class EstablishmentRepository extends EstablishmentInterface {
  @override
  Future<List<EstablecimientoModel>> getAll() async {
    final url = Uri.https(urlBase, '/api/client/establishments');

    http.Response response = await http.get(url, headers: headersToken());

    List<EstablecimientoModel> establecimientos =
        List<EstablecimientoModel>.from(json
            .decode(response.body)
            .map((x) => EstablecimientoModel.fromJson(x)));

    return establecimientos;
  }

  @override
  Future<EstablecimientoModel> getById(String idVet) async {
    final url = Uri.https(urlBase, '/api/client/establishment/$idVet');
    http.Response response = await http.get(url, headers: headersToken());

    EstablecimientoModel establecimiento =
        EstablecimientoModel.fromJson(json.decode(response.body));

    return establecimiento;
  }

  @override
  Future<EstablecimientoModel> getFirst() async {
    final url = Uri.https(urlBase, '/api/client/establishments');

    http.Response response = await http.get(url, headers: headersToken());

    List<EstablecimientoModel> establecimientos =
        List<EstablecimientoModel>.from(json
            .decode(response.body)
            .map((x) => EstablecimientoModel.fromJson(x)));

    return establecimientos.first;
  }

  @override
  Future<String> setNew(EstablecimientoEntity establecimiento) async {
    final url = Uri.https(urlBase, '/api/client/establishment');
    print(jsonEncode(establecimiento));
    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(establecimiento),
    );

    var data = jsonDecode(response.body);

    print(data);

    return 'abc';
  }
}
