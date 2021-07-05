import 'package:vet_app/src/stats/data/model/statsSalesMonthlyModel.dart';

import 'model/statCommentModel.dart';
import 'model/statsBaseModel.dart';
import 'model/statsSalesDailyModel.dart';
import 'model/statsServiceModel.dart';
import 'model/statsUserModel.dart';

abstract class StatsInterface {
  Future<StatBaseModel> getStatsBase(
      String establecimientoId, String from, String to);
  Future<List<StatCommentModel>> getStatsComment(
      String establecimientoId, String from, String to);
  Future<StatsServiceModel> getStatsService(
      String establecimientoId, String from, String to);
  Future<StatsSalesDailyModel> getStatsDaily(String establecimientoId);
  Future<StatsSalesMonthlyModel> getStatsMonthly(String establecimientoId);
  Future<StatsUserModel> getStatsUser(String establecimientoId);
}
