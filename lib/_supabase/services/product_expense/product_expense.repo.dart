import 'package:vet_app/_supabase/services/product_expense/product_expense.api.dart';

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
    String productSaleId,
  ) {
    return _api.addProductExpenseDetail(
      productName,
      price,
      quantity,
      supplierName,
      productTypeId,
      productSaleId,
    );
  }

  Future<void> getExpenses(int establishmentId) {
    return _api.getExpenses(establishmentId);
  }

  Future<void> getExpensesDetail(String id) {
    return _api.getExpensesDetail(id);
  }
}
