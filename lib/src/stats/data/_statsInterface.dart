import 'model/statCommentModel.dart';
import 'model/statsBaseModel.dart';

abstract class StatsInterface {
  Future<StatBaseModel> getStatsBase(
      String establecimientoId, String from, String to);
  Future<List<StatCommentModel>> getStatsComment(
      String establecimientoId, String from, String to);
}
