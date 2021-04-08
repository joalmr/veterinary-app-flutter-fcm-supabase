import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/stats/data/model/statCommentModel.dart';
import 'package:vet_app/src/stats/data/model/statsBaseModel.dart';
import 'package:vet_app/src/stats/data/statsRepository.dart';

class StatsController extends GetxController {
  final _repo = StatsRepository();

  StatBaseModel statBase = StatBaseModel();
  List<StatCommentModel> statComments = <StatCommentModel>[];

  RxBool cargaBase = false.obs;
  RxBool cargaComments = false.obs;

  @override
  void onInit() {
    inicial();
    super.onInit();
  }

  inicial() async {
    await getBase();
    await getComments();
  }

  getBase() => _getBase();

  _getBase() async {
    cargaBase.value = true;
    statBase =
        await _repo.getStatsBase(prefUser.vetId, '2020-01-22', '2021-03-22');
    cargaBase.value = false;
  }

  getComments() => _getComments();

  _getComments() async {
    cargaComments.value = true;
    statComments =
        await _repo.getStatsComment(prefUser.vetId, '2020-01-22', '2021-03-22');
    cargaComments.value = false;
  }
}
