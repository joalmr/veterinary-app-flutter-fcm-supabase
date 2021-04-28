import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/icons_map.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/serviceModel.dart';
import 'package:vet_app/src/offers/data/model/offerModel.dart';
import 'package:vet_app/src/offers/data/offersRepository.dart';

import '../offersController.dart';

class CreateOfferController extends GetxController {
  final _repo = OffersRepository();
  final _establecimientoRepo = EstablishmentRepository();

  final OffersController _padre = Get.find();

  RxList<ServiceVetModel> servicesVet = <ServiceVetModel>[].obs;

  final description = TextEditingController();

  RxInt _selectValue = 0.obs;
  int get selectValue => _selectValue.value;
  set selectValue(int val) => _selectValue.value = val;

  RxString _serviceNum = '1'.obs;
  String get serviceNum => _serviceNum.value;
  set serviceNum(String value) => _serviceNum.value = value;

  var moneyController = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );

  RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  @override
  void onInit() {
    getService();
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

  getService() => _getService();

  _getService() async {
    servicesVet.clear();
    var response = await _establecimientoRepo.getServiceVet();
    servicesVet.addAll(response);
    cargando = false;
  }

  
  create(String dispositivo) => _create(dispositivo);
  _create(String dispositivo) async {
    String type = '';
    type = selectValue == 0
        ? 'Amount'
        : selectValue == 1
            ? 'Percentage'
            : 'Total';

    var datos = double.tryParse(moneyController.numberValue.toString())??0.00;
    print(datos);
    
    if (description.text.trim() != "" && moneyController.text.trim() != "" && moneyController.numberValue > 0) {
      Offer offer = Offer();
      offer.description = description.text;
      offer.type = type;
      offer.discount = moneyController.numberValue.toStringAsFixed(2);
      offer.serviceId = '$serviceNum';
      offer.serviceName = textMap[serviceNum];

      await _repo.create(offer, prefUser.vetId);
      _padre.getAll();
      if(dispositivo=='app'){
        Get.back();
      }
    } 
    else{
      if (description.text.trim() == "")
        Get.snackbar(
          'Error',
          'Debe agregar una descripción',
          backgroundColor: colorRed,
          colorText: colorWhite,
        );
      else
        Get.snackbar(
          'Error',
          'Debe ingresar el monto y ser mayor a 0',
          backgroundColor: colorRed,
          colorText: colorWhite,
        );
    }

    // try{}
    // catch(e){
    //   Get.snackbar(
    //     'Error',
    //     'Debe ingresar el monto y ser mayor a 0',
    //     backgroundColor: colorRed,
    //     colorText: colorWhite,
    //   );
    // }
    
  }
}
