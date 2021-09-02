import 'package:get/get.dart';
import 'package:vet_app/_supabase/product/product_repo.dart';
import 'package:vet_app/src/sales/domain/sales_model.dart';

class SalesController extends GetxController {
  final _repo = ProductRepo();

  final salesList = <SalesDetailModel>[].obs;

  addSale() {
    double priceTotal = 0;
    salesList.forEach((element) {
      priceTotal += element.price!;
    });
    // _repo.addProductSale(priceTotal, petloverId, establishmentId)
  }
}
