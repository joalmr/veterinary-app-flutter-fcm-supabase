import 'dart:convert';
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:http/http.dart' as http;

import 'package:vet_app/src/offers/data/_offersInterface.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';

class OffersApi extends OffersInterface {
  @override
  Future<List<OfferModal>> getAll(String idVet) async {
    List<OfferModal> ofertas = [];
    final url = Uri.https(urlBase, '/api/client/establishment/$idVet/offers');

    http.Response response = await http.get(url, headers: headersToken());
    ofertas = offerModalFromJson(response.body);
    print(ofertas.length);
    return ofertas;
  }

  @override
  Future<int> create(Offer offer, String idVet) async {
    final url = Uri.https(urlBase, '/api/client/establishment/$idVet/offer');

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(offer),
    );

    return response.statusCode;
  }

  @override
  Future<int> delete(String idVet, String idOffer) async {
    final url =
        Uri.https(urlBase, '/api/client/establishment/$idVet/offer/$idOffer');

    http.Response response = await http.delete(url, headers: headersToken());

    return response.statusCode;
  }
}
