import 'package:vet_app/src/attentions/data/model/attentionRegModel.dart';

import '_attentionsInterface.dart';
import 'attentionApi.dart';

class AttentionRepository extends AttentionInterface{
  final _api = AttentionApi();
  
  @override
  Future<AttentionRegModel> getAll(String idVet) {
    return _api.getAll(idVet);
  }

}