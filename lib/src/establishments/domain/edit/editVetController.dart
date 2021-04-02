import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

import '../establishmentsController.dart';

part 'values.dart';

class EditVetController extends GetxController {
  final v = EditVetValue();

  getByid(String id) => _getByid(id);

  _getByid(String id) async {
    v.establishment.value = await v.establishmentRepo.getById(id);
    v.establishment.refresh();
  }

  seleccionarLogo(String id) {
    _procesarImagen(id, ImageSource.gallery);
    getByid(id);
    v.establishmentController.getAll();
  }

  _procesarImagen(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      v.establishmentRepo.setLogo(id, _image);
    } else {
      print('No image');
    }
  }
}
