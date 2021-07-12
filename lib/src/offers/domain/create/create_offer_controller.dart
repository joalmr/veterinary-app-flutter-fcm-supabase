import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/icons_map.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/service_model.dart';
import 'package:vet_app/src/offers/data/model/offer_model.dart';
import 'package:vet_app/src/offers/data/offers_repository.dart';

import '../offers_controller.dart';

class CreateOfferController extends GetxController {
  final _repo = OffersRepository();
  final _establecimientoRepo = EstablishmentRepository();

  final OffersController _padre = Get.find();

  RxList<ServiceVetModel> servicesVet = <ServiceVetModel>[].obs;

  final description = TextEditingController();

  final RxInt _selectValue = 0.obs;
  int get selectValue => _selectValue.value;
  set selectValue(int val) => _selectValue.value = val;

  final RxString _serviceNum = '1'.obs;
  String get serviceNum => _serviceNum.value;
  set serviceNum(String value) => _serviceNum.value = value;

  // TODO:  REVISAR OTRO TIPO DE MONEY CONTROLLER
  final moneyController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  final RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  @override
  void onInit() {
    getService();
    super.onInit();
  }

  getService() => _getService();

  Future<void> _getService() async {
    servicesVet.clear();
    final response = await _establecimientoRepo.getServiceVet();
    servicesVet.addAll(response);
    cargando = false;
  }

  create(String dispositivo) => _create(dispositivo);
  Future<void> _create(String dispositivo) async {
    String type = '';
    type = selectValue == 0
        ? 'Amount'
        : selectValue == 1
            ? 'Percentage'
            : 'Total';

    // final datos = double.tryParse(moneyController.numberValue.toString()) ?? 0.00;

    if (description.text.trim() != '' &&
        moneyController.text.trim() != '' &&
        moneyController.numberValue > 0) {
      final Offer offer = Offer();
      offer.description = description.text;
      offer.type = type;
      offer.discount = moneyController.numberValue.toStringAsFixed(2);
      offer.serviceId = serviceNum;
      offer.serviceName = textMap[serviceNum];

      final response = await _repo.create(offer, prefUser.vetId!);
      if (response == 200) {
        description.text = '';
        moneyController.text = '0.00';
        _padre.getAll();
        if (dispositivo == 'app') {
          Get.back();
        }
      }
    } else {
      if (description.text.trim() == '') {
        Get.snackbar(
          'Error',
          'Debe agregar una descripción',
          backgroundColor: colorRed,
          colorText: colorWhite,
        );
      } else {
        Get.snackbar(
          'Error',
          'Debe ingresar el monto y ser mayor a 0',
          backgroundColor: colorRed,
          colorText: colorWhite,
        );
      }
    }
  }
}
