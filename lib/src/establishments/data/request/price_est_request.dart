// "consultation_price_from": 10,
// "deworming_price_from": 10,
// "grooming_price_from": 20
// "vaccination_price_from": 10,
// "surgery_price_from": 80,

import 'package:get/get.dart';

class RxPriceEstablecimientoEntity {
  RxDouble consultationPriceFrom;
  RxDouble dewormingPriceFrom;
  RxDouble groomingPriceFrom;
  RxDouble vaccinationPriceFrom;

  RxPriceEstablecimientoEntity(
    this.consultationPriceFrom,
    this.dewormingPriceFrom,
    this.groomingPriceFrom,
    this.vaccinationPriceFrom,
  );
}

class PriceEstablecimientoEntity {
  double? consultationPriceFrom;
  double? dewormingPriceFrom;
  double? groomingPriceFrom;
  double? vaccinationPriceFrom;

  RxPriceEstablecimientoEntity? rx;
  PriceEstablecimientoEntity({
    this.consultationPriceFrom,
    this.dewormingPriceFrom,
    this.groomingPriceFrom,
    this.vaccinationPriceFrom,
  }) {
    rx = RxPriceEstablecimientoEntity(
      consultationPriceFrom!.obs,
      dewormingPriceFrom!.obs,
      groomingPriceFrom!.obs,
      vaccinationPriceFrom!.obs,
    );
  }

  Map<String, dynamic> toJson() => {
        'consultation_price_from': consultationPriceFrom,
        'deworming_price_from': dewormingPriceFrom,
        'grooming_price_from': groomingPriceFrom,
        'vaccination_price_from': vaccinationPriceFrom,
      };
}
