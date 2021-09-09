import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/sales_detail_model.dart';
import 'package:vet_app/_supabase/model/sales_model.dart';
import 'package:vet_app/_supabase/services/product_sale/product_sale.repo.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/config/variables_supabase.dart';

class MySalesController extends GetxController {
  final _repo = ProductRepo();

  final mySales = <SalesModel>[].obs;
  final salesDetail = <SalesDetailModel>[].obs;
  final totalSales = 0.0.obs;

  final cargando = false.obs;
  RealtimeSubscription? subscriptionMessage;
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  @override
  void onInit() {
    if (prefUser.tokenHas() &&
        prefUser.vetDataHas() &&
        prefUser.vetIdSupaHas()) {
      runSubscription();
      getSales();
    }

    super.onInit();
  }

  getSales() async {
    final response = await _repo.getSales(prefUser.vetIdSupa);
    mySales.clear();
    mySales.addAll(response);
  }

  getSaleDetail(String idSale) async {
    final response = await _repo.getSaleDetail(idSale);
    salesDetail.clear();
    salesDetail.addAll(response);

    salesDetail.forEach((element) {
      totalSales.value += (element.price! * element.quantity!);
    });
  }

  void runSubscription() {
    subscriptionMessage = supabaseClient
        .from('product_sale')
        .on(SupabaseEventTypes.insert, (payload) => getSales())
        .on(SupabaseEventTypes.update, (payload) => getSales())
        .on(SupabaseEventTypes.delete, (payload) => getSales())
        .subscribe();
  }
}
