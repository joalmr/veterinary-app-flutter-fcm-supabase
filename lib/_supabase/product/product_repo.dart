import 'package:vet_app/_supabase/model/sales_detail_model.dart';
import 'package:vet_app/_supabase/model/sales_model.dart';

import 'product_api.dart';

class ProductRepo {
  final _api = ProductApi();

  Future<String> addProductSale(int petloverId, int establishmentId) {
    return _api.addProductSale(petloverId, establishmentId);
  }

  Future<void> updateProductSale(double price, String idProduct) {
    return _api.updateProductSale(price, idProduct);
  }

  Future<void> addProductSaleDetail(
    String name,
    double price,
    int quantity,
    int productTypeId,
    String productSaleId,
  ) {
    return _api.addProductSaleDetail(
      name,
      price,
      quantity,
      productTypeId,
      productSaleId,
    );
  }

  Future<List<SalesModel>> getSales(int id) {
    return _api.getSales(id);
  }

  Future<List<SalesDetailModel>> getSaleDetail(String id) {
    return _api.getSaleDetail(id);
  }

  Future<void> getProductType() {
    return _api.getProductType();
  }
}
