import 'dart:convert';
import 'dart:io';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/src/registros/data/model/attention_detail_model.dart';
import 'package:vet_app/src/registros/data/model/attention_reg_model.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/src/registros/data/model/show_file_model.dart';
import '_attentions_interface.dart';
import 'model/filter_attention.dart';

class AttentionApi extends AttentionInterface {
  @override
  Future<AttentionRegModel> getAll(
      String idVet, FilterAttention filtros) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idVet/attentions',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(filtros),
    );

    return AttentionRegModel.fromJson(json.decode(response.body));
  }

  @override
  Future<AttentionDetailModel> getAttentionDetail(
      String establishment, String atencion) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/attention/$atencion',
    );

    final http.Response response = await http.get(url, headers: headersToken());

    final attention = attentionDetailModelFromJson(response.body);

    return attention;
  }

  @override
  Future<dynamic> downloadFile(String establishment, String attention) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/attention/$attention/file/download',
    );

    final response = await http.get(url, headers: headersToken());

    return response.body;
  }

  @override
  Future<ShowFile?> showFile(String establishment, String attention) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/attention/$attention/file',
    );

    final response = await http.get(url, headers: headersToken());
    try {
      return showFileFromJson(response.body);
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<dynamic> uploadFile(
      String establishment, String attention, File file) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/file',
    );

    final request = http.MultipartRequest('POST', url);
    final pic = await http.MultipartFile.fromPath('file', file.path);

    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['Authorization'] = 'Bearer ${prefUser.token}';
    request.headers['X-Requested-With'] = 'XMLHttpRequest';

    request.files.add(pic);
    final response = await request.send();

    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);

    return responseString;
  }

  @override
  Future deleteFile(String establishment, String attention, int fileId) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishment/attention/$attention/file');

    final dataJson = {'file_id': fileId};
    final http.Response response = await http.delete(
      url,
      headers: headersToken(),
      body: jsonEncode(dataJson),
    );

    return response.statusCode;
  }
}
