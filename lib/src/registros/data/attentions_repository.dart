import 'package:vet_app/src/registros/data/model/attention_reg_model.dart';

import '_attentions_interface.dart';
import 'attention_api.dart';
import 'model/filter_attention.dart';

class AttentionRepository extends AttentionInterface {
  final _api = AttentionApi();

  @override
  Future<AttentionRegModel> getAll(String idVet, FilterAttention filtros) {
    return _api.getAll(idVet, filtros);
  }
}
