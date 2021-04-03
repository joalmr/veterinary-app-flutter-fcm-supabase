// To parse this JSON data, do
//
//     final offerModal = offerModalFromJson(jsonString);

import 'dart:convert';

List<OfferModal> offerModalFromJson(String str) =>
    List<OfferModal>.from(json.decode(str).map((x) => OfferModal.fromJson(x)));

String offerModalToJson(List<OfferModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferModal {
  OfferModal({
    this.id,
    this.offer,
  });

  String id;
  Offer offer;

  factory OfferModal.fromJson(Map<String, dynamic> json) => OfferModal(
        id: json["id"],
        offer: Offer.fromJson(json["offer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer": offer.toJson(),
      };
}

class Offer {
  Offer({
    this.serviceId,
    this.description,
    this.type,
    this.discount,
    this.serviceName,
  });

  String serviceId;
  String description;
  String type;
  String discount;
  String serviceName;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        serviceId: json["service_id"],
        description: json["description"],
        type: json["type"],
        discount: json["discount"],
        serviceName: json["service_name"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId,
        "description": description,
        "type": type,
        "discount": discount,
        "service_name": serviceName,
      };
}
