import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/sales_detail.model.dart';
import 'package:vet_app/_supabase/model/sales.model.dart';
import 'package:vet_app/config/variables_supabase.dart';

class ProductApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  ////
  Future<String> addProductSale(int petloverId, int establishmentId) async {
    final response = await supabaseClient.from('product_sale').insert([
      {
        'establishment_id': establishmentId,
        'petlover_id': petloverId,
        'price': 0,
      }
    ]).execute();

    final dato = response.data as List;

    return dato.first['id'];
  }

  Future<void> updateProductSale(double price, String idProduct) async {
    // final response =
    await supabaseClient
        .from('product_sale')
        .update({'price': price})
        .eq('id', idProduct)
        .execute();

    // final dato = response.data as List;
  }

  Future<void> addProductSaleDetail(
    String name,
    double price,
    int quantity,
    int productTypeId,
    String productSaleId,
  ) async {
    // final response =
    await supabaseClient.from('product_sale_detail').insert([
      {
        'name': name,
        'price': price,
        'quantity': quantity,
        'product_type_id': productTypeId,
        'product_sale_id': productSaleId,
      }
    ]).execute();

    // final dato = response.data as List;
    // print(dato);
  }

  Future<List<SalesModel>> getSales(int id) async {
    List<SalesModel> sales = [];

    final response = await supabaseClient
        .from('product_sale')
        .select('''*, petlover (*)''')
        .eq('establishment_id', id)
        .order('registered_at', ascending: false)
        .execute();

    if (response.data != null) {
      final dato = response.data as List;
      sales = dato.map((e) => SalesModel.fromJson(e)).toList();
    }

    return sales;
  }

  Future<List<SalesDetailModel>> getSaleDetail(String id) async {
    List<SalesDetailModel> sales = [];

    final response = await supabaseClient
        .from('product_sale_detail')
        .select()
        .eq('product_sale_id', id)
        .execute();

    if (response.data != null) {
      final dato = response.data as List;
      sales = dato.map((e) => SalesDetailModel.fromJson(e)).toList();
    }

    return sales;
  }

  Future<void> getProductType() async {
    // final response =
    await supabaseClient.from('product_type').select().execute();

    // final dato = response.data as List;
    // print(dato);
  }
}
