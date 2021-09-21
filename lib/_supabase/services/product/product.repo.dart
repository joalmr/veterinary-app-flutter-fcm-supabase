import 'package:vet_app/_supabase/services/product/product.api.dart';

class ProductGeneralRepo {
  final _api = ProductGeneralApi();

  Future<dynamic> generalVersus() {
    return _api.generalVersus();
  }
}
