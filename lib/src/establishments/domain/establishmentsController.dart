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

  go2Show(String id) => _go2Show(id);

  _go2Show(String id) async {
    print(id);
    v.cargaById = true;
    await getByid(id);
    v.cargaById = false;
    Get.toNamed('/establishments/show');
  }

  getByid(String id) => _getByid(id);

  _getByid(String id) async {
    v.establishment = await establishmentRepo.getById(id);
    print(v.establishment.name);
    print(v.establishment.description);
    print(v.establishment.employees.length);
    print(v.establishment.prices.grooming.from);
  }

  deldete(String id) => _deldete(id);

  _deldete(String id) async {
    await establishmentRepo.deleteEstablishmetn(id);
    getAll();
  }
}
