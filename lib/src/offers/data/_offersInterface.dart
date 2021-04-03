import 'model/offerModel.dart';

abstract class OffersInterface {
  Future<List<OfferModal>> getAll(String idVet);
  Future<int> create(Offer offer, String idVet);
  Future<int> delete(String idVet, String idOffer);
}
