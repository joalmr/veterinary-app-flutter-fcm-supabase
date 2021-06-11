import 'package:vet_app/src/registros/data/model/attentionRegModel.dart';

import '_attentionsInterface.dart';
import 'attentionApi.dart';
import 'model/filterAttention.dart';

class AttentionRepository extends AttentionInterface{
  final _api = AttentionApi();
  
  @override
  Future<AttentionRegModel> getAll(String idVet,FilterAttention filtros) {
    return _api.getAll(idVet,filtros);
  }

}