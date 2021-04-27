import 'model/statCommentModel.dart';
import 'model/statsBaseModel.dart';
import 'model/statsServiceModel.dart';

abstract class StatsInterface {
  Future<StatBaseModel> getStatsBase(String establecimientoId, String from, String to);
  Future<List<StatCommentModel>> getStatsComment(String establecimientoId, String from, String to);
  Future<StatsServiceModel> getStatsService(String establecimientoId, String from, String to);
  Future<StatsServiceModel> getStatsDaily(String establecimientoId, String type);
  Future<StatsServiceModel> getStatsMonthly(String establecimientoId, String type);
}
