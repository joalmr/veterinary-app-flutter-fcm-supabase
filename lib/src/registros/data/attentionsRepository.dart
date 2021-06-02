import 'package:vet_app/src/registros/data/model/attentionRegModel.dart';

import '_attentionsInterface.dart';
import 'attentionApi.dart';

class AttentionRepository extends AttentionInterface{
  final _api = AttentionApi();
  
  @override
  Future<AttentionRegModel> getAll(String idVet, String from, String to) {
    return _api.getAll(idVet,from,to);
  }

}