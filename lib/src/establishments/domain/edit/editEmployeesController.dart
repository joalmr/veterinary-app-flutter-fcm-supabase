import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';

class EditEmployeeController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();

  var employees = <Employee>[].obs;

  RxString _personalType = '2'.obs;
  String get personalType => _personalType.value;
  set personalType(String value) => _personalType.value = value;

  @override
  void onInit() {
    getEmployees();

    super.onInit();
  }

  getEmployees() => _getEmployees();
  _getEmployees() async {
    employees.clear();
    var response =
        await _repo.getAllEmployees(showVetController.establishment.value.id);

    employees.addAll(response);
  }

  addEmployee() => _addEmployee();
  _addEmployee() async {
    // await _repo.setEmployee(
    //   establecimientoId,
    //   typeId,
    //   name,
    //   code,
    // );
  }

  updateEmployee() => _updateEmployee();
  _updateEmployee() async {
    // await _repo.updateEmployee(
    //   showVetController.establishment.value.id,
    //   employeeId,
    //   typeId,
    //   name,
    //   code,
    // );
  }

  deleteEmployee(String employeeId) => _deleteEmployee(employeeId);
  _deleteEmployee(String employeeId) async {
    await _repo.deleteEmployee(
      showVetController.establishment.value.id,
      employeeId,
    );
    getEmployees();
    showVetController.getByid();
  }
}
