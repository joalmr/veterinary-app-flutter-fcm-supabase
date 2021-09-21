import 'package:supabase/supabase.dart';

import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/config/variables_supabase.dart';

import 'expense/expense.model.dart';
import 'sale/income.model.dart';

class ProductGeneralApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  Future<dynamic> generalVersus() async {
    final dataJson = [
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
      {
        'ingreso': '-',
        'egreso': '-',
      },
    ];
    List<IncomeDataModel> income = await sumIncome();
    for (var item in income) {
      switch (item.productTypeId) {
        case 1:
          dataJson[0]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 2:
          dataJson[1]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 3:
          dataJson[2]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 4:
          dataJson[3]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 5:
          dataJson[4]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 6:
          dataJson[5]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 7:
          dataJson[6]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        default:
      }
    }

    List<ExpenseDataModel> expense = await sumExpense();
    for (var item in expense) {
      switch (item.productTypeId) {
        case 1:
          dataJson[0]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 2:
          dataJson[1]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 3:
          dataJson[2]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 4:
          dataJson[3]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 5:
          dataJson[4]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 6:
          dataJson[5]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 7:
          dataJson[6]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        default:
      }
    }

    return dataJson;
  }

  Future<List<IncomeDataModel>> sumIncome() async {
    List<IncomeDataModel> income = [];

    final response = await supabaseClient.rpc(
      'income',
      params: {
        'valorid': prefUser.vetIdSupa.toString(),
      },
    ).execute();

    if (response.data != null) {
      final dato = response.data as List;
      income = dato.map((e) => IncomeDataModel.fromJson(e)).toList();
    }

    return income;
  }

  Future<List<ExpenseDataModel>> sumExpense() async {
    List<ExpenseDataModel> expense = [];

    final response = await supabaseClient.rpc(
      'expense',
      params: {
        'valorid': prefUser.vetIdSupa.toString(),
      },
    ).execute();

    if (response.data != null) {
      final dato = response.data as List;
      expense = dato.map((e) => ExpenseDataModel.fromJson(e)).toList();
    }

    return expense;
  }
}
