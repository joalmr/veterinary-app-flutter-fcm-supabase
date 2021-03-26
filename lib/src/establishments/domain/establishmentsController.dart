import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/view/_children/show/showVet.dart';
import 'values/establishmentValue.dart';

class EstablishmentsController extends GetxController {
  final EstablishmentRepository establishmentRepo;

  EstablishmentsController({
    @required this.establishmentRepo,
  });

  final v = EstablishmentValue();

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
    getAll();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    v.carga = true;
    await Future.delayed(Duration(milliseconds: 2));
    getAll();
    return null;
  }

  getAll() => _getAll();

  _getAll() async {
    final lista = await establishmentRepo.getAll();
    v.establecimientos.clear();
    v.establecimientos.addAll(lista);
    print('fin getAll');
  }

  deldete(String id) => _deldete(id);

  _deldete(String id) async {
    await establishmentRepo.deleteEstablishmetn(id);
    getAll();
  }

  go2Show(String id) => _go2Show(id);

  _go2Show(String id) async {
    v.cargaById = true;
    await getByid(id);
    v.cargaById = false;
    Get.to(ShowVetMain(id: id));
  }

  getByid(String id) => _getByid(id);

  _getByid(String id) async {
    v.establishment = await establishmentRepo.getById(id);
  }

  seleccionarLogo(String id) {
    _procesarImagen(id, ImageSource.gallery);
    getByid(id);
    getAll();
  }

  _procesarImagen(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      establishmentRepo.setLogo(id, _image);
    } else {
      print('No image');
    }
  }
}
