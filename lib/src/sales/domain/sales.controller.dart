import 'package:get/get.dart';
import 'package:vet_app/_supabase/product/product_repo.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';

import 'package:vet_app/src/sales/domain/sales_model.dart';
import 'package:vet_app/src/sales/presentation/sales.dart';

class SalesController extends GetxController {
  final _repo = ProductRepo();

  final salesList = <SalesDetailPreview>[].obs;
  final totalSales = 0.0.obs;

  final cargando = false.obs;

  @override
  void onInit() {
    super.onInit();
    salesList.clear();
  }

  getTotal() {
    totalSales.value = 0;

    salesList.forEach((element) {
      totalSales.value += (element.price! * element.quantity!);
    });
  }

  addSale(int idPetlover) async {
    double priceTotal = 0;
    cargando.value = true;

    if (salesList.isEmpty) {
      snackBarMessage(
        message: 'No tiene productos agregados',
      );

      cargando.value = false;
    } else {
      String saleId =
          await _repo.addProductSale(idPetlover, prefUser.vetIdSupa);

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
      Get.off(SalesMain());
    }
  }
}
