import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import '../establishmentsController.dart';

class EditVetController extends GetxController {
  final _repo = EstablishmentRepository();

  final EstablishmentsController establishmentController = Get.find();

  var _establishment = EstablishmentModal().obs;
  EstablishmentModal get establishment => _establishment.value;
  set establishment(EstablishmentModal value) => _establishment.value = value;

  RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  var argumentoId;

  final descripcionControl = TextEditingController();

  @override
  void onInit() {
    argumentoId = Get.arguments;
    getByid();
    super.onInit();
  }

  @override
  void onClose() {
    establishmentController.getAll();
    super.onClose();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    cargando = true;
    await Future.delayed(Duration(milliseconds: 2));
    getByid();
    return null;
  }

  getByid() => _getByid();

  _getByid() async {
    cargando = true;
    establishment = await _repo.getById(argumentoId);

    update(['showVet']);

    descripcionControl.text = establishment.description;
    //
    cargando = false;
  }

  seleccionarLogo() async {
    await _procesarImagen(argumentoId, ImageSource.gallery);

    update(['showVet']);
  }

  _procesarImagen(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      establishment.logo = await _repo.setLogo(id, _image);
    } else {
      print('No image');
    }
  }

  editServicio() => _editService();
  _editService() {}

  editDescripcion() => _editDescription();
  _editDescription() async {
    await _repo.setDescription(argumentoId, descripcionControl.text);
    descripcionControl.text = "";
    getByid();
    Get.back();
  }

  editPrecios() => _editPrices();
  _editPrices() {}

  editHorario() => _editSchedule();
  _editSchedule() {}

  editEmpleado() => _editEmployee();
  _editEmployee() {}
}
