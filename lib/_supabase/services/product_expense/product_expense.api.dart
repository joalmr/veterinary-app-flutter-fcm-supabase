import 'package:supabase/supabase.dart';
import 'package:vet_app/config/variables_supabase.dart';

class ProductExpenseApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

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
    String productSaleId,
  ) async {
    await supabaseClient.from('product_expense_detail').insert([
      {
        'product_name': productName,
        'price': price,
        'quantity': quantity,
        'supplier_name': supplierName,
        'product_type_id': productTypeId,
        'product_expense_id': productSaleId,
      }
    ]).execute();
  }

  Future<void> getExpenses(int establishmentId) async {
    // List<ExpensesModel> expenses = [];

    final response = await supabaseClient
        .from('product_expense')
        .select('*')
        .eq('establishment_id', establishmentId)
        .order('created_at', ascending: false)
        .execute();

    print(response.data);
    if (response.data != null) {
      final dato = response.data as List;
      // expenses = dato.map((e) => ExpensesModel.fromJson(e)).toList();
    }

    // return expenses;
  }

  Future<void> getExpensesDetail(String id) async {
    // List<ExpensesDetailModel> expenses = [];

    final response = await supabaseClient
        .from('product_expense_detail')
        .select()
        .eq('product_expense_id', id)
        .execute();

    print(response.data);
    if (response.data != null) {
      final dato = response.data as List;
      // expenses = dato.map((e) => ExpensesDetailModel.fromJson(e)).toList();
    }

    // return expenses;
  }
}
