import 'model/attention_reg_model.dart';
import 'model/filter_attention.dart';

abstract class AttentionInterface {
  Future<AttentionRegModel> getAll(String idVet, FilterAttention filtros);
}
