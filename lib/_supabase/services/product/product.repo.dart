import 'package:vet_app/_supabase/services/product/product.api.dart';

class ProductGeneralRepo {
  final _api = ProductGeneralApi();

  Future<dynamic> generalVersus(String fechain, String fechaout) {
    return _api.generalVersus(fechain, fechaout);
  }

  Future<dynamic> totalValuesversus(String fechain, String fechaout) {
    return _api.totalValuesversus(fechain, fechaout);
  }
}
