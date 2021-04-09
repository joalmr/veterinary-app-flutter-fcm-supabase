import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import '../establishmentsController.dart';

class ShowVetController extends GetxController {
  final _repo = EstablishmentRepository();

  final EstablishmentsController establishmentController = Get.find();

  var _establishment = EstablishmentModal().obs;
  EstablishmentModal get establishment => _establishment.value;
  set establishment(EstablishmentModal value) => _establishment.value = value;

  RxBool _cargando = true.obs;
  bool get cargando => _cargando.value;
  set cargando(bool val) => _cargando.value = val;

  var argumentoId;

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

    cargando = false;
  }

  seleccionarLogo() async {
    await _procesarLogo(argumentoId, ImageSource.gallery);
  }

  _procesarLogo(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      establishment.logo = await _repo.setLogo(id, _image);
      getByid();
    } else {
      print('No image');
    }
  }

  seleccionarSlide() async {
    await _procesarSlide(argumentoId, ImageSource.gallery);
  }

  _procesarSlide(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await _repo.setSlides(id, _image);
      getByid();
      Get.back();
    } else {
      print('No image');
    }
  }

  editServicio() => _editService();
  _editService() {}

  editHorario() => _editSchedule();
  _editSchedule() {}

  editEmpleado() => _editEmployee();
  _editEmployee() {}
}
