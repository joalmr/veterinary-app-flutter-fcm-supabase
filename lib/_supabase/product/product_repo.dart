import 'product_api.dart';

class ProductRepo {
  final _api = ProductApi();

  Future<void> addProductSale(
    double price,
    int petloverId,
    int establishmentId,
  ) {
    return _api.addProductSale(price, petloverId, establishmentId);
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

  Future<void> getSales(int id) {
    return _api.getSales(id);
  }

  Future<void> getProductType() {
    return _api.getProductType();
  }
}
