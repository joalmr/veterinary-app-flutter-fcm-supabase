import 'model/attention_detail_model.dart';
import 'model/attention_reg_model.dart';
import 'model/filter_attention.dart';

abstract class AttentionInterface {
  Future<AttentionRegModel> getAll(String idVet, FilterAttention filtros);
  Future<AttentionDetailModel> getAttentionDetail(
      String establishment, String atencion);
}
