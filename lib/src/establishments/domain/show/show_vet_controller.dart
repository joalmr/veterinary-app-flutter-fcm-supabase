import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

// import '../establishmentsController.dart';

class ShowVetController extends GetxController {
  final _repo = EstablishmentRepository();
  // final vetController = Get.find<EstablishmentsController>();

  var establishment = EstablishmentModal().obs;

  var initialTab = 0.obs;

  RxBool cargando = true.obs;

  String? argumentoId;

  @override
  void onInit() {
    argumentoId = Get.arguments as String?;
    getByid();
    super.onInit();
  }

  Future refresh() => _refresh();

  Future<Null> _refresh() async {
    cargando.value = true;
    await Future.delayed(const Duration(milliseconds: 2));
    getByid();
    return null;
  }

  getByid() => _getByid();

  _getByid() async {
    cargando.value = true;
    establishment.value = await _repo.getById(argumentoId!);
    cargando.value = false;
  }

  seleccionarLogo() async {
    await _procesarLogo(argumentoId!, ImageSource.gallery);
  }

  _procesarLogo(String id, ImageSource origen) async {
    File _image;
    var pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      establishment.value.logo = await _repo.setLogo(id, _image);
      establishment.refresh();
    } else {
      print('No image');
    }
  }

  seleccionarSlide() async {
    await _procesarSlide(argumentoId!, ImageSource.gallery);
  }

  _procesarSlide(String id, ImageSource origen) async {
    File _image;
    final pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await _repo.setSlides(id, _image);
      await getByid();
      Get.back();
    } else {
      print('No image');
    }
  }

  void eliminarSlide(String slide) => _eliminarSlide(slide);
  _eliminarSlide(String slide) async {
    final shortSlide = slide.split('/storage/')[1];

    await _repo.deleteSlide(argumentoId!, shortSlide);
    getByid();
    Get.close(2);
  }
}
