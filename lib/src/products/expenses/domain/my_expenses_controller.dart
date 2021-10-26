import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/expense.model.dart';
import 'package:vet_app/_supabase/model/expenses_detail.model.dart';
import 'package:vet_app/_supabase/services/product/expense/product_expense.repo.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/config/variables_supabase.dart';

class MyExpensesController extends GetxController {
  final _repo = ProductExpenseRepo();

  final myExpenses = <ExpenseModel>[].obs;
  final expensesDetail = <ExpensesDetailModel>[].obs;
  final totalExpenses = 0.0.obs;

  final cargando = false.obs;
  RealtimeSubscription? subscriptionMessage;
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  @override
  void onInit() {
    if (prefUser.tokenHas() &&
        prefUser.vetDataHas() &&
        prefUser.vetIdSupaHas()) {
      runSubscription();
      getExpenses();
    }

    super.onInit();
  }

  getExpenses() async {
    final response = await _repo.getExpenses(prefUser.vetIdSupa);
    myExpenses.clear();
    myExpenses.addAll(response);
  }

  getExpensesDetail(String idExpenses) async {
    final response = await _repo.getExpensesDetail(idExpenses);
    expensesDetail.clear();
    expensesDetail.addAll(response);

    expensesDetail.forEach((element) {
      totalExpenses.value += (element.price! * element.quantity!);
    });
  }

  void runSubscription() {
    subscriptionMessage = supabaseClient
        .from('product_expense')
        .on(SupabaseEventTypes.insert, (payload) => getExpenses())
        .on(SupabaseEventTypes.update, (payload) => getExpenses())
        .on(SupabaseEventTypes.delete, (payload) => getExpenses())
        .subscribe();
  }
}
