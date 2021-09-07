import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/sales_model.dart';
import 'package:vet_app/_supabase/product/product_repo.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/config/variables_supabase.dart';
import 'package:vet_app/src/sales/domain/sales_model.dart';

class SalesController extends GetxController {
  final _repo = ProductRepo();

  final salesList = <SalesDetailModel>[].obs;

  final mySales = <SalesModel>[].obs;

  final cargando = false.obs;
  RealtimeSubscription? subscriptionMessage;
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  @override
  void onInit() {
    super.onInit();
    runSubscription();
    getSales();
  }

  getSales() async {
    final response = await _repo.getSales(prefUser.vetIdSupa);
    mySales.clear();
    mySales.addAll(response);
  }

  void runSubscription() {
    subscriptionMessage = supabaseClient
        .from('product_sale')
        .on(SupabaseEventTypes.all, (payload) {
      getSales();
    }).subscribe();
  }

  addSale(int idPetlover) async {
    double priceTotal = 0;

    cargando.value = true;

    String saleId = await _repo.addProductSale(idPetlover, prefUser.vetIdSupa);

    salesList.forEach((element) {
      _repo.addProductSaleDetail(
        element.name!,
        element.price!,
        element.quantity!,
        element.productTypeId!,
        saleId,
      );
      priceTotal += (element.price! * element.quantity!);
    });

    _repo.updateProductSale(priceTotal, saleId);

    cargando.value = false;
    salesList.clear();
    Get.back();
  }
}
