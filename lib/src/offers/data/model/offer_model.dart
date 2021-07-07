// To parse this JSON data, do
//
//     final offerModal = offerModalFromJson(jsonString);

import 'dart:convert';

import 'package:vet_app/resources/utils/datetime_format.dart';

List<OfferModal> offerModalFromJson(String str) =>
    List<OfferModal>.from(json.decode(str).map((x) => OfferModal.fromJson(x)));

class OfferModal {
  String? id;
  String? date;
  Offer? offer;

  OfferModal({
    this.id,
    this.date,
    this.offer,
  });

  factory OfferModal.fromJson(Map<String, dynamic> json) => OfferModal(
        id: json['id'],
        date: formatDateOut(
          valor: json['date'],
          formatIn: 'yyyy-MM-dd',
          formatOut: 'dd-MM-yyyy',
        ),
        offer: Offer?.fromJson(json['offer']),
      );
}

class Offer {
  Offer({
    this.serviceId,
    this.description,
    this.type,
    this.discount,
    this.serviceName,
  });

  String? serviceId;
  String? description;
  String? type;
  String? discount;
  String? serviceName;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        serviceId: json['service_id'],
        description: json['description'],
        type: json['type'],
        discount: json['discount'],
        serviceName: json['service_name'],
      );

  Map<String, dynamic> toJson() => {
        'service_id': serviceId,
        'description': description,
        'type': type,
        'discount': discount,
        'service_name': serviceName,
      };
}
