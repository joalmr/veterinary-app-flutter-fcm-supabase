import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

class ShowVetController extends GetxController {
  final _repo = EstablishmentRepository();
  final _global = Get.find<GlobalController>();
  // final vetController = Get.find<EstablishmentsController>();

  final establishment = EstablishmentModal().obs;
  final initialTab = 0.obs;
  final cargando = true.obs;

  final argumentoId = ''.obs;

  @override
  void onInit() {
    argumentoId.value = Get.arguments;
    getByid();
    super.onInit();
  }

  // @override
  // Future refresh() => _refresh();

  // Future<dynamic> _refresh() async {
  //   cargando.value = true;
  //   await Future.delayed(const Duration(milliseconds: 2));
  //   getByid();
  //   return null;
  // }

  getByid() => _getByid();

  Future<void> _getByid() async {
    cargando.value = true;
    establishment.value = await _repo.getById(argumentoId.value);
    cargando.value = false;
  }

  seleccionarLogo() async {
    await _procesarLogo(argumentoId.value, ImageSource.gallery);
    _global.generalLoad();
  }

  Future<void> _procesarLogo(String id, ImageSource origen) async {
    File _image;
    final pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      establishment.value.logo = await _repo.setLogo(id, _image);
      establishment.refresh();
    } else {
      log('No image');
    }
  }

  Future<void> seleccionarSlide() async {
    await _procesarSlide(argumentoId.value, ImageSource.gallery);
    _global.generalLoad();
  }

  Future<void> _procesarSlide(String id, ImageSource origen) async {
    File _image;
    final pickedFile =
        await ImagePicker().getImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      await _repo.setSlides(id, _image);
      await getByid();
      Get.back();
    } else {
      log('No image');
    }
  }

  void eliminarSlide(String slide) => _eliminarSlide(slide);
  Future<void> _eliminarSlide(String slide) async {
    final shortSlide = slide.split('/storage/')[1];

    await _repo.deleteSlide(argumentoId.value, shortSlide);
    getByid();
    _global.generalLoad();
    Get.close(2);
  }
}
