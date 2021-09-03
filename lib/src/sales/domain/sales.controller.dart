import 'package:get/get.dart';
import 'package:vet_app/_supabase/product/product_repo.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/sales/domain/sales_model.dart';

class SalesController extends GetxController {
  final _repo = ProductRepo();

  final salesList = <SalesDetailModel>[].obs;

  addSale() async {
    double priceTotal = 0;

    String saleId = await _repo.addProductSale(3, prefUser.vetIdSupa);

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
  }
}
