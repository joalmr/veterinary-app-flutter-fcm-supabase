import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

class EditDescriptionController extends GetxController {
  final _repo = EstablishmentRepository();
  final descripcionControl = TextEditingController();
  final showVetController = Get.find<ShowVetController>();
  // final vetController = Get.find<EstablishmentsController>();
  final _global = Get.find<GlobalController>();

  @override
  void onInit() {
    descripcionControl.text =
        showVetController.establishment.value.description!;
    super.onInit();
  }

  editDescripcion() => _editDescription();
  Future<void> _editDescription() async {
    await _repo.setDescription(
        showVetController.argumentoId.value, descripcionControl.text);
    descripcionControl.text = '';

    showVetController.getByid();
    // vetController.getAll();
    _global.generalLoad();
    showVetController.initialTab.value = 1;
    Get.back();
  }
}
