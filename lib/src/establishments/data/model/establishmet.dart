import 'dart:convert';

EstablishmentModal establishmentModalFromJson(String str) =>
    EstablishmentModal.fromJson(json.decode(str));

class EstablishmentModal {
  String address;
  String description;
  List<Employee> employees;
  String id;
  double latitude;
  String logo;
  double longitude;
  String name;
  String phone;
  Prices prices;
  String reference;
  String ruc;
  Schedule schedule;
  List<Service> services;
  List<String> slides;
  String stars;
  String type;
  int typeId;
  String website;

  EstablishmentModal({
    this.address,
    this.description,
    this.employees,
    this.id,
    this.latitude,
    this.logo,
    this.longitude,
    this.name,
    this.phone,
    this.prices,
    this.reference,
    this.ruc,
    this.schedule,
    this.services,
    this.slides,
    this.stars,
    this.type,
    this.typeId,
    this.website,
  });

  factory EstablishmentModal.fromJson(Map<String, dynamic> json) =>
      EstablishmentModal(
        address: json["address"],
        description: json["description"],
        employees: List<Employee>.from(
            json["employees"].map((x) => Employee.fromJson(x))),
        id: json["id"],
        latitude: json["latitude"].toDouble(),
        logo: json["logo"],
        longitude: json["longitude"].toDouble(),
        name: json["name"],
        phone: json["phone"],
        prices: Prices.fromJson(json["prices"]),
        reference: json["reference"],
        ruc: json["ruc"],
        schedule: Schedule.fromJson(json["schedule"]),
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
        slides: List<String>.from(json["slides"].map((x) => x)),
        stars: json["stars"],
        type: json["type"],
        typeId: json["type_id"],
        website: json["website"],
      );
}

class Employee {
  String id;
  String establishmentId;
  int typeId;
  String name;
  String code;

  Employee({
    this.id,
    this.establishmentId,
    this.typeId,
    this.name,
    this.code,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        establishmentId: json["establishment_id"],
        typeId: json["type_id"],
        name: json["name"],
        code: json["code"] == null ? null : json["code"],
      );
}

class Service {
  Service({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Prices {
  Price consultation;
  Price deworming;
  Price vaccination;
  Price grooming;

  Prices({
    this.consultation,
    this.deworming,
    this.vaccination,
    this.grooming,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        consultation: Price.fromJson(json["consultation"]),
        deworming: Price.fromJson(json["deworming"]),
        vaccination: Price.fromJson(json["vaccination"]),
        grooming: Price.fromJson(json["grooming"]),
      );
}

class Price {
  Price({
    this.from,
    this.to,
  });

  String from;
  String to;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        from: json["from"] == null ? null : json["from"].toString(),
        to: json["to"],
      );
}

class Schedule {
  Schedule({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;
  Day saturday;
  Day sunday;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        monday: Day.fromJson(json["monday"]),
        tuesday: Day.fromJson(json["tuesday"]),
        wednesday: Day.fromJson(json["wednesday"]),
        thursday: Day.fromJson(json["thursday"]),
        friday: Day.fromJson(json["friday"]),
        saturday: Day.fromJson(json["saturday"]),
        sunday: Day.fromJson(json["sunday"]),
      );

  Map<String, dynamic> toJson() => {
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
      };
}

class Day {
  Day({
    this.daySwitch,
    this.timeStart,
    this.timeEnd,
  });

  bool daySwitch;
  String timeStart;
  String timeEnd;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        daySwitch: json["switch"] == null ? false : json["switch"],
        timeStart: json["time_start"] == null ? '' : json["time_start"],
        timeEnd: json["time_end"] == null ? '' : json["time_end"],
      );

  Map<String, dynamic> toJson() => {
        "switch": daySwitch,
        "time_start": timeStart,
        "time_end": timeEnd,
      };
}
