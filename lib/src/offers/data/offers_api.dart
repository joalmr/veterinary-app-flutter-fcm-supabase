import 'dart:convert';
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:http/http.dart' as http;

import 'package:vet_app/src/offers/data/_offers_interface.dart';
import 'package:vet_app/src/offers/data/model/offer_model.dart';

class OffersApi extends OffersInterface {
  @override
  Future<List<OfferModal>> getAll(String idVet) async {
    List<OfferModal> ofertas = [];
    final url = Uri.https(urlBase!, '/api/client/establishment/$idVet/offers');

    final http.Response response = await http.get(url, headers: headersToken());
    ofertas = offerModalFromJson(response.body);

    return ofertas;
  }

  @override
  Future<int> create(Offer offer, String idVet) async {
    final url = Uri.https(urlBase!, '/api/client/establishment/$idVet/offer');

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(offer),
    );

    return response.statusCode;
  }

  @override
  Future<int> delete(String idVet, String idOffer) async {
    final url =
        Uri.https(urlBase!, '/api/client/establishment/$idVet/offer/$idOffer');

    final http.Response response =
        await http.delete(url, headers: headersToken());

    return response.statusCode;
  }
}
