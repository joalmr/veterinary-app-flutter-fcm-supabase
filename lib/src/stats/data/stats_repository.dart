import 'package:vet_app/src/stats/data/model/stats_base_model.dart';

import 'package:vet_app/src/stats/data/model/stat_comment_model.dart';
import 'package:vet_app/src/stats/data/model/stats_service_model.dart';
import 'package:vet_app/src/stats/data/model/stats_user_model.dart';

import '_stats_interface.dart';
import 'model/stats_sales_daily_model.dart';
import 'model/stats_sales_monthly_model.dart';
import 'stats_api.dart';

class StatsRepository extends StatsInterface {
  final _api = StatsApi();

  @override
  Future<StatBaseModel> getStatsBase(
      String establecimientoId, String from, String to) {
    return _api.getStatsBase(establecimientoId, from, to);
  }

  @override
  Future<List<StatCommentModel>> getStatsComment(
      String establecimientoId, String from, String to) {
    return _api.getStatsComment(establecimientoId, from, to);
  }

  @override
  Future<StatsServiceModel> getStatsService(
      String establecimientoId, String from, String to) {
    return _api.getStatsService(establecimientoId, from, to);
  }

  @override
  Future<StatsSalesDailyModel> getStatsDaily(String establecimientoId) {
    return _api.getStatsDaily(establecimientoId);
  }

  @override
  Future<StatsSalesMonthlyModel> getStatsMonthly(String establecimientoId) {
    return _api.getStatsMonthly(establecimientoId);
  }

  @override
  Future<StatsUserModel> getStatsUser(String establecimientoId) {
    return _api.getStatsUser(establecimientoId);
  }
}
