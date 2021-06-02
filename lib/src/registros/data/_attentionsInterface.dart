import 'model/attentionRegModel.dart';

abstract class AttentionInterface {
  Future<AttentionRegModel> getAll(String idVet,String from, String to);
}