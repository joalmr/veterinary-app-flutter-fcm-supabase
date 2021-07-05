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
        id: json['id'] as String?,
        date: formatDateOut(
          valor: json['date'] as String,
          formatIn: 'yyyy-MM-dd',
          formatOut: 'dd-MM-yyyy',
        ),
        offer: Offer?.fromJson(json['offer'] as Map<String, dynamic>),
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
        serviceId: json['service_id'] as String?,
        description: json['description'] as String?,
        type: json['type'] as String?,
        discount: json['discount'] as String?,
        serviceName: json['service_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'service_id': serviceId,
        'description': description,
        'type': type,
        'discount': discount,
        'service_name': serviceName,
      };
}
