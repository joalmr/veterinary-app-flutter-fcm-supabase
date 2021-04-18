import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';

class EditDescriptionController extends GetxController {
  final _repo = EstablishmentRepository();
  final descripcionControl = TextEditingController();
  final showVetController = Get.find<ShowVetController>();

  @override
  void onInit() {
    descripcionControl.text = showVetController.establishment.value.description;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  editDescripcion() => _editDescription();
  _editDescription() async {
    await _repo.setDescription(
        showVetController.argumentoId, descripcionControl.text);
    descripcionControl.text = "";

    showVetController.getByid();
    showVetController.initialTab.value = 1;
    Get.back();
  }
}
