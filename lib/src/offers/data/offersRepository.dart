import 'package:vet_app/src/establishments/data/model/serviceModel.dart';
import 'package:vet_app/src/offers/data/_offersInterface.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';

import 'offersApi.dart';

class OffersRepository extends OffersInterface {
  final _api = OffersApi();

  @override
  Future<List<OfferModal>> getAll(String idVet) {
    return _api.getAll(idVet);
  }

  @override
  Future<int> create(Offer offer, String idVet) {
    return _api.create(offer, idVet);
  }

  @override
  Future<int> delete(String idVet, String idOffer) {
    return _api.delete(idVet, idOffer);
  }
}
