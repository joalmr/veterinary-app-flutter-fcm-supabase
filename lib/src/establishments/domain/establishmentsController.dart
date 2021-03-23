import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'values/establishmentValue.dart';

class EstablishmentsController extends GetxController {
  final establishmentRepo = EstablishmentRepository();
  final v = EstablishmentValue();

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  @override
  void onReady() {
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
}
