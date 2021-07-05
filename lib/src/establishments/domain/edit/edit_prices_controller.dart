import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/request/priceEstRequest.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import '../establishments_controller.dart';

class EditPricesController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();
  final vetController = Get.find<EstablishmentsController>();

  final consultaControl = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );
  final desparasitaControl = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );
  final vacunaControl = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );
  final groomingControl = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: '',
  );

  PriceEstablecimientoEntity prices = new PriceEstablecimientoEntity();

  @override
  void onInit() {
    consultaControl.text = double.parse(
            showVetController.establishment.value.prices!.consultation!.from!)
        .toStringAsFixed(2);
    desparasitaControl.text = double.parse(
            showVetController.establishment.value.prices!.deworming!.from!)
        .toStringAsFixed(2);
    vacunaControl.text = double.parse(
            showVetController.establishment.value.prices!.vaccination!.from!)
        .toStringAsFixed(2);
    groomingControl.text = double.parse(
            showVetController.establishment.value.prices!.grooming!.from!)
        .toStringAsFixed(2);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  editPrecios() => _editPrices();
  _editPrices() async {
    prices.consultationPriceFrom = consultaControl.numberValue;
    prices.dewormingPriceFrom = desparasitaControl.numberValue;
    prices.groomingPriceFrom = groomingControl.numberValue;
    prices.vaccinationPriceFrom = vacunaControl.numberValue;
    await _repo.setPrices(showVetController.argumentoId!, prices);

    showVetController.getByid();
    vetController.getAll();
    showVetController.initialTab.value = 2;
    Get.back();
  }
}
