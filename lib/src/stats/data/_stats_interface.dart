import 'package:vet_app/src/stats/data/model/service_stats_versus_sales.model.dart';
import 'package:vet_app/src/stats/data/model/stats_sales_monthly_model.dart';

import 'model/stat_comment_model.dart';
import 'model/stats_base_model.dart';
import 'model/stats_sales_daily_model.dart';
import 'model/stats_service_model.dart';
import 'model/stats_user_model.dart';

abstract class StatsInterface {
  Future<StatBaseModel> getStatsBase(
      String establecimientoId, String from, String to);
  Future<List<StatCommentModel>> getStatsComment(
      String establecimientoId, String from, String to);
  Future<ServicesStatsModel> servicesStat(
    String establecimientoId,
    String fechain,
    String fechaout,
  );
  Future<StatsServiceModel> getStatsService(
      String establecimientoId, String from, String to);
  Future<StatsSalesDailyModel> getStatsDaily(String establecimientoId);
  Future<StatsSalesMonthlyModel> getStatsMonthly(String establecimientoId);
  Future<StatsUserModel> getStatsUser(String establecimientoId);
}
