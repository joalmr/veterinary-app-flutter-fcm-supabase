import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/expense.model.dart';

import 'package:vet_app/_supabase/model/expenses_detail.model.dart';
import 'package:vet_app/config/variables_supabase.dart';

class ProductExpenseApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  ////
  Future<String> addProductExpense(int establishmentId) async {
    final response = await supabaseClient.from('product_expense').insert([
      {
        'establishment_id': establishmentId,
        'price': 0,
      }
    ]).execute();

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<void> updateProductExpense(double price, String idExpense) async {
    // final response =
    await supabaseClient
        .from('product_expense')
        .update({'price': price})
        .eq('id', idExpense)
        .execute();
  }

  Future<void> addProductExpenseDetail(
    String productName,
    double price,
    int quantity,
    String supplierName,
    int productTypeId,
    String productExpenseId,
  ) async {
    await supabaseClient.from('product_expense_detail').insert([
      {
        'product_name': productName,
        'price': price,
        'quantity': quantity,
        'supplier_name': supplierName,
        'product_type_id': productTypeId,
        'product_expense_id': productExpenseId,
      }
    ]).execute();
  }

  Future<List<ExpenseModel>> getExpenses(int establishmentId) async {
    List<ExpenseModel> expenses = [];

    final response = await supabaseClient
        .from('product_expense')
        .select('*')
        .eq('establishment_id', establishmentId)
        .order('created_at', ascending: false)
        .execute();

    if (response.data != null) {
      final dato = response.data as List;
      expenses = dato.map((e) => ExpenseModel.fromJson(e)).toList();
    }

    return expenses;
  }

  Future<List<ExpensesDetailModel>> getExpensesDetail(String id) async {
    List<ExpensesDetailModel> expenses = [];

    final response = await supabaseClient
        .from('product_expense_detail')
        .select()
        .eq('product_expense_id', id)
        .execute();

    if (response.data != null) {
      final dato = response.data as List;
      expenses = dato.map((e) => ExpensesDetailModel.fromJson(e)).toList();
    }

    return expenses;
  }
}
