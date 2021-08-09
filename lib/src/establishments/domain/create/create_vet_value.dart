import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class CreateVetValue {
  List<TextEditingController> iniController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> endController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  RxList<bool> checkDay = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  RxList<String> iniDay = [
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
  ].obs;

  RxList<String> endDay = [
    '20:00',
    '20:00',
    '20:00',
    '20:00',
    '20:00',
    '20:00',
    '20:00',
  ].obs;

  final nameVet = TextEditingController();
  final phoneVet = TextEditingController();
  final rucVet = TextEditingController();
  final webVet = TextEditingController();
  final dirVet = TextEditingController();
  final personalNameVet = TextEditingController();
  final personalCodeVet = TextEditingController();
  final descriptionVet = TextEditingController();
  // final inputDireccionController = new TextEditingController();

  final moneyConsulta = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final moneyDesparasita = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final moneyVacuna = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
  final moneyGrooming = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
  );
}
