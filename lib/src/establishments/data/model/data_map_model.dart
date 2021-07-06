// To parse this JSON data, do
//
//     final dataMapModel = dataMapModelFromJson(jsonString);

import 'dart:convert';

DataMapModel dataMapModelFromJson(String str) =>
    DataMapModel.fromJson(json.decode(str));

String dataMapModelToJson(DataMapModel data) => json.encode(data.toJson());

class DataMapModel {
  DataMapModel({
    this.result,
    this.status,
  });

  Result? result;
  String? status;

  factory DataMapModel.fromJson(Map<String, dynamic> json) => DataMapModel(
        result: Result?.fromJson(json['result'] as Map<String, dynamic>),
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'result': result?.toJson(),
        'status': status,
      };
}

class Result {
  Result({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.name,
    this.placeId,
  });

  List<AddressComponent>? addressComponents;
  String? formattedAddress;
  Geometry? geometry;
  String? name;
  String? placeId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(
            json['address_components']
                .map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json['formatted_address'],
        geometry: Geometry?.fromJson(json['geometry'] as Map<String, dynamic>),
        name: json['name'],
        placeId: json['place_id'],
      );

  Map<String, dynamic> toJson() => {
        'address_components':
            List<dynamic>.from(addressComponents?.map((x) => x.toJson()) ?? []),
        'formatted_address': formattedAddress,
        'geometry': geometry?.toJson(),
        'name': name,
        'place_id': placeId,
      };
}

class AddressComponent {
  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  String? longName;
  String? shortName;
  List<String>? types;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json['long_name'],
        shortName: json['short_name'],
        types: List<String>.from(json['types'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'long_name': longName,
        'short_name': shortName,
        'types': List<dynamic>.from(types!.map((x) => x)),
      };
}

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location? location;
  Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location?.fromJson(json['location'] as Map<String, dynamic>),
        viewport: Viewport?.fromJson(json['viewport'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'viewport': viewport?.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json['lat'],
        lng: json['lng'],
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location? northeast;
  Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast:
            Location?.fromJson(json['northeast'] as Map<String, dynamic>),
        southwest:
            Location?.fromJson(json['southwest'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'northeast': northeast!.toJson(),
        'southwest': southwest!.toJson(),
      };
}
