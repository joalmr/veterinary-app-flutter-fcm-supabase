import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/stats/data/model/statCommentModel.dart';
import 'package:vet_app/src/stats/data/model/statsBaseModel.dart';
import 'package:vet_app/src/stats/data/model/statsSalesDailyModel.dart';
import 'package:vet_app/src/stats/data/model/statsSalesMonthlyModel.dart';
import 'package:vet_app/src/stats/data/model/statsServiceModel.dart';
import 'package:vet_app/src/stats/data/statsRepository.dart';

class StatsController extends GetxController {
  final _repo = StatsRepository();

  var statBase = StatBaseModel().obs;
  var statComments = <StatCommentModel>[].obs;
  var services = <Services>[].obs;
  var salesDay = <SalesDay>[].obs;
  var salesMonth = <SalesMonth>[].obs;

  RxBool cargaBase = false.obs;
  RxBool cargaComments = false.obs;
  RxBool cargaServices = false.obs;
  RxBool cargaSalesDay = false.obs;
  RxBool cargaSalesMonth = false.obs;

  @override
  void onInit() {
    inicial();
    super.onInit();
  }

  inicial() async {
    getBase();
    getComments();
    getStatsService();
    getStatsDaily();
    getStatsMonthly();
  }

  getBase() => _getBase();

  _getBase() async {
    cargaBase.value = true;
    statBase.value = await _repo.getStatsBase(prefUser.vetId, '2020-01-22', '2021-03-22');
    cargaBase.value = false;
  }

  getComments() => _getComments();

  _getComments() async {
    cargaComments.value = true;
    var values = await _repo.getStatsComment(prefUser.vetId, '2020-01-22', '2021-03-22');
    statComments.addAll(values);
    cargaComments.value = false;
  }

  getStatsService()=>_getStatsService();
  _getStatsService() async {
    cargaServices.value = true;
    var values = await _repo.getStatsService(prefUser.vetId, '2020-01-22', '2021-03-22');
    services.addAll(values.result.services);
    cargaServices.value = false;
  }

  getStatsDaily()=>_getStatsDaily();
  _getStatsDaily() async {
    cargaSalesDay.value = true;
    var values = await _repo.getStatsDaily(prefUser.vetId);
    salesDay.addAll(values.result.salesDay);
    cargaSalesDay.value = false;
  }

  getStatsMonthly()=>_getStatsMonthly();
  _getStatsMonthly() async {
    cargaSalesMonth.value = true;
    var values = await _repo.getStatsMonthly(prefUser.vetId);
    salesMonth.addAll(values.result.salesMonth);
    cargaSalesMonth.value = false;
  }
}
