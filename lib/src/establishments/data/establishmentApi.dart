import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vet_app/recursos/utils/headerHttp.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/establishments/data/model/establishmentModelLite.dart';
import 'package:vet_app/src/establishments/data/model/serviceModel.dart';
import '_establishmentInterface.dart';
import 'model/establishmet.dart';
import 'request/establishmentRequest.dart';
import 'request/priceEstRequest.dart';

class EstablishmentApi extends EstablishmentInterface {
  @override
  Future<List<EstablecimientoModelLite>> getAll() async {
    final url = Uri.https(urlBase, '$pathBase/establishments');

    http.Response response = await http.get(url, headers: headersToken());

    List<EstablecimientoModelLite> establecimientos =
        List<EstablecimientoModelLite>.from(json
            .decode(response.body)
            .map((x) => EstablecimientoModelLite.fromJson(x)));

    return establecimientos;
  }

  @override
  Future<EstablishmentModal> getById(String idVet) async {
    final url = Uri.https(urlBase, '$pathBase/establishment/$idVet');
    http.Response response = await http.get(url, headers: headersToken());

    EstablishmentModal establecimiento =
        EstablishmentModal.fromJson(json.decode(response.body));

    return establecimiento;
  }

  @override
  Future<EstablecimientoModelLite> getFirst() async {
    final url = Uri.https(urlBase, '$pathBase/establishments');

    http.Response response = await http.get(url, headers: headersToken());

    List<EstablecimientoModelLite> establecimientos =
        List<EstablecimientoModelLite>.from(json
            .decode(response.body)
            .map((x) => EstablecimientoModelLite.fromJson(x)));

    return establecimientos.first;
  }

  @override
  Future<List<ServiceVetModel>> getServiceVet() async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/services',
    );

    http.Response response = await http.get(
      url,
      headers: headersToken(),
    );

    var data = serviceVetModelFromJson(response.body);

    return data;
  }

  @override
  Future<List<dynamic>> setNew(EstablecimientoEntity establecimiento) async {
    final url = Uri.https(urlBase, '$pathBase/establishment');
    var lista = [];

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(establecimiento),
    );

    var data = jsonDecode(response.body);

    lista.add(response.statusCode);
    lista.add(data['id']);

    return lista;
  }

  @override
  Future<String> setEmployee(
    String establecimientoId,
    int typeId,
    String name,
    String code,
  ) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/employee',
    );

    final employee = {
      "type_id": typeId,
      "name": name,
      "code": code,
    };

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(employee),
    );

    var data = jsonDecode(response.body);

    print(data);
    return 'asd';
  }

  @override
  Future<String> setPrices(
    String establecimientoId,
    PriceEstablecimientoEntity precios,
  ) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/prices',
    );

    print(jsonEncode(precios));
    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(precios),
    );

    var data = jsonDecode(response.body);

    print(data);
    return 'asd';
  }

  @override
  Future<String> setSchedule(
    String establecimientoId,
    horarios,
  ) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/schedule',
    );

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(horarios),
    );

    var data = jsonDecode(response.body);

    print(data);
    return 'asd';
  }

  @override
  Future<String> setDescription(
    String establecimientoId,
    String description,
  ) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/description',
    );

    final descriptionData = {
      "description": description,
    };
    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(descriptionData),
    );

    var data = jsonDecode(response.body);

    print(data);
    return 'asd';
  }

  @override
  Future<void> deleteEstablishmetn(String establecimientoId) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId',
    );

    http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );

    var data = jsonDecode(response.body);
    print(data);
  }

  @override
  Future<String> setLogo(String establecimientoId, File image) async {
    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/logo',
    );

    var request = http.MultipartRequest("POST", url);
    var pic = await http.MultipartFile.fromPath("logo", image.path);

    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['Authorization'] = 'Bearer ${prefUser.logged}';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';

    request.files.add(pic);
    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    var dato = jsonDecode(responseString);

    return dato['logo'];
  }
}
