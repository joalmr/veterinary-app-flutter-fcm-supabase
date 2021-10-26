import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/services/product/product_general_data.dart';

import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/config/variables_supabase.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';

import 'expense/expense.model.dart';
import 'sale/income.model.dart';

class ProductGeneralApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  Future<dynamic> generalVersus(String fechain, String fechaout) async {
    final outDate = toDateBasic(fechaout).add(Duration(days: 1));
    fechaout = formatDateBasic(outDate);

    List<IncomeDataModel> income = await sumIncome(fechain, fechaout);
    for (var item in income) {
      switch (item.productTypeId) {
        case 1:
          generalVersusData[0]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 2:
          generalVersusData[1]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 3:
          generalVersusData[2]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 4:
          generalVersusData[3]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 5:
          generalVersusData[4]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 6:
          generalVersusData[5]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 7:
          generalVersusData[6]['ingreso'] = item.sum!.toStringAsFixed(2);
          break;
        default:
      }
    }

    List<ExpenseDataModel> expense = await sumExpense(fechain, fechaout);
    for (var item in expense) {
      switch (item.productTypeId) {
        case 1:
          generalVersusData[0]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 2:
          generalVersusData[1]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 3:
          generalVersusData[2]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 4:
          generalVersusData[3]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 5:
          generalVersusData[4]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 6:
          generalVersusData[5]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        case 7:
          generalVersusData[6]['egreso'] = item.sum!.toStringAsFixed(2);
          break;
        default:
      }
    }

    return generalVersusData;
  }

  Future<List<IncomeDataModel>> sumIncome(
    String fechain,
    String fechaout,
  ) async {
    List<IncomeDataModel> income = [];

    final response = await supabaseClient.rpc(
      'income',
      params: {
        'valorid': prefUser.vetIdSupa.toString(),
        'fechain': fechain,
        'fechaout': fechaout
      },
    ).execute();

    if (response.data != null) {
      final dato = response.data as List;
      income = dato.map((e) => IncomeDataModel.fromJson(e)).toList();
    }

    return income;
  }

  Future<List<ExpenseDataModel>> sumExpense(
    String fechain,
    String fechaout,
  ) async {
    List<ExpenseDataModel> expense = [];

    final response = await supabaseClient.rpc(
      'expense',
      params: {
        'valorid': prefUser.vetIdSupa.toString(),
        'fechain': fechain,
        'fechaout': fechaout
      },
    ).execute();

    if (response.data != null) {
      final dato = response.data as List;
      expense = dato.map((e) => ExpenseDataModel.fromJson(e)).toList();
    }

    return expense;
  }

  Future<dynamic> totalValuesversus(String fechain, String fechaout) async {
    final outDate = toDateBasic(fechaout).add(Duration(days: 1));
    fechaout = formatDateBasic(outDate);

    double totalIncome = 0;
    double totalExpense = 0;

    List<IncomeDataModel> income = await sumIncome(fechain, fechaout);
    if (income.isNotEmpty) {
      for (var item in income) {
        totalIncome = totalIncome + item.sum!;
      }
    }

    List<ExpenseDataModel> expense = await sumExpense(fechain, fechaout);
    if (expense.isNotEmpty) {
      for (var item in expense) {
        totalExpense = totalExpense + item.sum!;
      }
    }

    return {'income': totalIncome, 'expense': totalExpense};
  }
}
