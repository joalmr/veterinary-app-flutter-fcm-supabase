import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/components/colorGenerate.dart';
import 'package:vet_app/src/stats/data/model/statCommentModel.dart';
import 'package:vet_app/src/stats/data/model/statsBaseModel.dart';
import 'package:vet_app/src/stats/data/model/statsSalesDailyModel.dart';
import 'package:vet_app/src/stats/data/model/statsSalesMonthlyModel.dart';
import 'package:vet_app/src/stats/data/model/statsServiceModel.dart';
import 'package:vet_app/src/stats/data/statsRepository.dart';

class StatsController extends GetxController {
  final _repo = StatsRepository();

  final fechaIn = TextEditingController();
  final fechaOut = TextEditingController();

  RxString msgfechaIn = "".obs;
  RxString msgfechaOut = "".obs;

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

  final hoy = DateTime.now();

  DateTime? initialIn;
  DateTime? initialOut;

  @override
  void onInit() {
    initialIn = DateTime(hoy.year, (hoy.month - 2), hoy.day);
    initialOut = hoy;

    fechaIn.text = formatDateBasic(initialIn!); //formatDate
    fechaOut.text = formatDateBasic(initialOut!);

    cargaStats();
    super.onInit();
  }

  cargaStats() async {
    getBase();
    getComments();
    getStatsService();
    getStatsDaily();
    getStatsMonthly();
  }

  ejecStats() {
    var date1 = toDateBasic(fechaIn.text);
    var date2 = toDateBasic(fechaOut.text);
    var diffDate = date2.difference(date1);

    if (diffDate.inDays < 1) {
      Get.snackbar(
        'Error',
        'La "fecha desde" debe ser anterior a la "fecha hasta"',
        backgroundColor: colorRed,
        colorText: colorWhite,
      );
    } else {
      cargaStats();
      Get.back(); //TODO: para app
    }
  }

  Future selectIn(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialIn!,
        firstDate: new DateTime(2020),
        lastDate: initialOut!.add(Duration(days: -1)));
    if (picked != null) {
      initialIn = picked;
      fechaIn.text = formatDateBasic(picked);
    }
  }

  Future selectOut(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialOut!,
        firstDate: new DateTime(2020),
        lastDate: new DateTime.now());
    if (picked != null) {
      initialOut = picked;
      fechaOut.text = formatDateBasic(picked);
    }
  }

  getBase() => _getBase();
  _getBase() async {
    cargaBase.value = true;
    var response =
        await _repo.getStatsBase(prefUser.vetId!, fechaIn.text, fechaOut.text);
    statBase.update((val) {
      val!.stars = response.stars;
      val.votes = response.votes;
      val.dogs = response.dogs;
      val.cats = response.cats;
      val.nonAttendedPercentage = response.nonAttendedPercentage;
    });
    cargaBase.value = false;
  }

  getComments() => _getComments();
  _getComments() async {
    cargaComments.value = true;
    statComments.clear();
    var values = await _repo.getStatsComment(
        prefUser.vetId!, fechaIn.text, fechaOut.text);
    statComments.addAll(values);
    cargaComments.value = false;
  }

  var paiChartList = <PieChartSectionData>[].obs;
  var radiusPie = 25.obs;
  getStatsService() => _getStatsService();
  _getStatsService() async {
    cargaServices.value = true;

    services.clear();
    paiChartList.clear();

    var values = await _repo.getStatsService(
        prefUser.vetId!, fechaIn.text, fechaOut.text);
    services.addAll(values.result!.services!);

    services.forEach((element) {
      PieChartSectionData temp = new PieChartSectionData(
        color: UniqueColorGenerator.getColor().withOpacity(0.7),
        value: element.value!.toDouble(),
        showTitle: false,
        radius: 25,
      );
      paiChartList.add(temp);
    });

    cargaServices.value = false;
  }

  getStatsDaily() => _getStatsDaily();
  _getStatsDaily() async {
    cargaSalesDay.value = true;
    salesDay.clear();
    var values = await _repo.getStatsDaily(prefUser.vetId!);
    salesDay.addAll(values.result!.salesDay!);
    cargaSalesDay.value = false;
  }

  getStatsMonthly() => _getStatsMonthly();
  _getStatsMonthly() async {
    cargaSalesMonth.value = true;
    salesMonth.clear();
    var values = await _repo.getStatsMonthly(prefUser.vetId!);
    
    salesMonth.addAll(values.result!.salesMonth!);
    cargaSalesMonth.value = false;
  }
}
