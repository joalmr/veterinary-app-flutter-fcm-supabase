import 'package:vet_app/_supabase/model/expense.model.dart';
import 'package:vet_app/_supabase/model/expenses_detail.model.dart';
import 'package:vet_app/_supabase/services/product/expense/product_expense.api.dart';

class ProductExpenseRepo {
  final _api = ProductExpenseApi();

  Future<String> addProductExpense(int establishmentId) {
    return _api.addProductExpense(establishmentId);
  }

  Future<void> updateProductExpense(double price, String idExpense) {
    return _api.updateProductExpense(price, idExpense);
  }

  Future<void> addProductExpenseDetail(
    String productName,
    double price,
    int quantity,
    String supplierName,
    int productTypeId,
    String productExpenseId,
  ) {
    return _api.addProductExpenseDetail(
      productName,
      price,
      quantity,
      supplierName,
      productTypeId,
      productExpenseId,
    );
  }

  Future<List<ExpenseModel>> getExpenses(int establishmentId) {
    return _api.getExpenses(establishmentId);
  }

  Future<List<ExpensesDetailModel>> getExpensesDetail(String id) {
    return _api.getExpensesDetail(id);
  }
}
