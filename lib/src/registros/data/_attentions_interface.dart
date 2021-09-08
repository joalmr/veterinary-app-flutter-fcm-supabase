import 'dart:io';

import 'package:vet_app/src/registros/data/model/show_file_model.dart';

import 'model/attention_detail_model.dart';
import 'model/attention_reg_model.dart';
import 'model/filter_attention.dart';

abstract class AttentionInterface {
  Future<AttentionRegModel> getAll(String idVet, FilterAttention filtros);
  Future<AttentionDetailModel> getAttentionDetail(
      String establishment, String atencion);
  Future<ShowFile?> showFile(String establishment, String attention);
  Future<dynamic> downloadFile(String establishment, String attention);
  Future<dynamic> deleteFile(
      String establishment, String attention, int fileId);
  Future<dynamic> uploadFile(String establishment, String attention, File file);
}
