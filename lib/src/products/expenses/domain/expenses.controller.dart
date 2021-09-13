import 'package:get/get.dart';
import 'package:vet_app/_supabase/services/product_expense/product_expense.repo.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/products/expenses/domain/_expenses_model.dart';
import 'package:vet_app/src/products/expenses/presentation/expenses.dart';

class ExpensesController extends GetxController {
  final _repo = ProductExpenseRepo();

  final expensesList = <ExpensesDetailPreview>[].obs;
  final totalExpenses = 0.0.obs;

  final cargando = false.obs;

  @override
  void onInit() {
    super.onInit();
    expensesList.clear();
  }

  getTotal() {
    totalExpenses.value = 0;

    expensesList.forEach((element) {
      totalExpenses.value += (element.price! * element.quantity!);
    });
  }

  addExpense() async {
    double priceTotal = 0;
    cargando.value = true;

    if (expensesList.isEmpty) {
      snackBarMessage(
        message: 'No tiene productos agregados',
      );

      cargando.value = false;
    } else {
      String expenseId = await _repo.addProductExpense(prefUser.vetIdSupa);

      expensesList.forEach((element) {
        _repo.addProductExpenseDetail(
          element.name!,
          element.price!,
          element.quantity!,
          element.proveedor!,
          element.productTypeId!,
          expenseId,
        );
        priceTotal += (element.price! * element.quantity!);
      });

      _repo.updateProductExpense(priceTotal, expenseId);

      cargando.value = false;
      expensesList.clear();
      Get.off(ExpensesMain());
    }
  }
}
