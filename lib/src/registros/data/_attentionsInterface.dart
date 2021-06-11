import 'model/attentionRegModel.dart';
import 'model/filterAttention.dart';

abstract class AttentionInterface {

  Future<AttentionRegModel> getAll(String idVet,FilterAttention filtros);
}