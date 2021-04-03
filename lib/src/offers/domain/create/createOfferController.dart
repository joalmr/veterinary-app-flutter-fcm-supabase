import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';
import 'package:vet_app/src/offers/data/offersRepository.dart';

import '../offersController.dart';

class CreateOfferController extends GetxController {
  final _repo = OffersRepository();

  final OffersController _padre = Get.find();

  final description = TextEditingController();

  RxInt _selectValue = 0.obs;
  int get selectValue => _selectValue.value;
  set selectValue(int val) => _selectValue.value = val;

  var moneyController = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  create() => _create();

  _create() async {
    String type = '';
    type = selectValue == 0
        ? 'Amount'
        : selectValue == 1
            ? 'Percentage'
            : 'Total';

    Offer offer = Offer();
    offer.description = description.text;
    offer.type = type;
    offer.discount = moneyController.numberValue.toStringAsFixed(2);
    offer.serviceId = '6';
    offer.serviceName = 'Electrocardiograma';

    await _repo.create(offer, prefUser.vetId);
    _padre.getAll();
    Get.back();
  }
}
