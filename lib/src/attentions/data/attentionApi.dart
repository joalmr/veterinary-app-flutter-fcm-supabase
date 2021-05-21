import 'dart:convert';

import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/src/attentions/data/model/attentionRegModel.dart';
import 'package:http/http.dart' as http;
import '_attentionsInterface.dart';

class AttentionApi extends AttentionInterface{
  @override
  Future<AttentionRegModel> getAll(String idVet) async {
    //? TODO: poner las fechas
    final url = Uri.https(
      urlBase, '/api/client/establishment/$idVet/attentions',
      {
        "from": '2020-05-14',
        "to": '2021-05-14',
      },
    );

    http.Response response = await http.get(url, headers: headersToken());

    return AttentionRegModel.fromJson(json.decode(response.body));
  }

}