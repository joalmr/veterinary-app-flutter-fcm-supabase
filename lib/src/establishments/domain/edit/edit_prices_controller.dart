import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/request/price_est_request.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import '../establishments_controller.dart';

class EditPricesController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();
  final vetController = Get.find<EstablishmentsController>();

  final consultaControl = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final desparasitaControl = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final vacunaControl = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final groomingControl = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );

  PriceEstablecimientoEntity prices = PriceEstablecimientoEntity();

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

  editPrecios() => _editPrices();
  Future<void> _editPrices() async {
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
