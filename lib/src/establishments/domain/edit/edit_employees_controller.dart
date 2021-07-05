import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/show/app/components/employees/set_employee.dart';

import '../establishments_controller.dart';

class EditEmployeeController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();
  final vetController = Get.find<EstablishmentsController>();

  var employees = <Employee>[].obs;

  var _personalType = '2'.obs;
  String get personalType => _personalType.value;
  set personalType(String value) => _personalType.value = value;

  var employeeId = ''.obs;
  var name = ''.obs;
  var code = ''.obs;

  var isNew = true.obs;

  @override
  void onInit() {
    getEmployees();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getEmployees() => _getEmployees();
  _getEmployees() async {
    employees.clear();
    var response =
        await _repo.getAllEmployees(showVetController.establishment.value.id!);

    employees.addAll(response);
  }

  goToNew() {
    isNew.value = false;
    employeeId.value = '';
    name.value = '';
    code.value = '';
    personalType = '2';

    Get.to(SetEmployee());
  }

  addEmployee() => _addEmployee();
  _addEmployee() async {
    var reponse = await _repo.setEmployee(
      showVetController.establishment.value.id!,
      int.parse(personalType),
      name.value,
      code.value,
    );
    if (reponse == '200') {
      getEmployees();
      showVetController.getByid();
      Get.back();
      showVetController.initialTab.value = 4;
    }
  }

  goToUpdate(Employee employee) {
    isNew.value = false;
    employeeId.value = employee.id!;
    name.value = employee.name!;
    code.value = employee.code!;
    personalType = employee.typeId.toString();
    Get.to(SetEmployee());
  }

  updateEmployee() => _updateEmployee();
  _updateEmployee() async {
    if (personalType == '1') {
      code.value = '';
    }
    var reponse = await _repo.updateEmployee(
      showVetController.establishment.value.id!,
      employeeId.value,
      int.parse(personalType),
      name.value,
      code.value,
    );
    if (reponse == '200') {
      getEmployees();
      showVetController.getByid();
      vetController.getAll();
      Get.back();
      showVetController.initialTab.value = 4;
    }
  }

  deleteEmployee(String employeeId) => _deleteEmployee(employeeId);
  _deleteEmployee(String employeeId) async {
    await _repo.deleteEmployee(
      showVetController.establishment.value.id!,
      employeeId,
    );
    getEmployees();
    showVetController.getByid();
    showVetController.initialTab.value = 4;
  }
}
