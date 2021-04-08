import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/recursos/utils/headerHttp.dart';
import 'package:vet_app/src/stats/data/model/statsBaseModel.dart';
import 'package:vet_app/src/stats/data/model/statCommentModel.dart';
import 'package:http/http.dart' as http;

import '_statsInterface.dart';

class StatsApi extends StatsInterface {
  @override
  Future<StatBaseModel> getStatsBase(
      String establecimientoId, String from, String to) async {
    print('getStatsBase');

    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/stats',
      {
        "from": from,
        "to": to,
      },
    );

    http.Response response = await http.get(url, headers: headersToken());
    print(response.statusCode);
    final statsBase = statBaseModelFromJson(response.body);

    return statsBase;
  }

  @override
  Future<List<StatCommentModel>> getStatsComment(
      String establecimientoId, String from, String to) async {
    print('getStatsComment');

    final url = Uri.https(
      urlBase,
      '$pathBase/establishment/$establecimientoId/comments',
      {
        "from": from,
        "to": to,
      },
    );

    http.Response response = await http.get(url, headers: headersToken());
    print(response.statusCode);
    final statsComment = statCommentModelFromJson(response.body);

    return statsComment;
  }
}
