import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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

  final moneyConsulta = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: 'S/ ',
  );
  final moneyDesparasita = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: 'S/ ',
  );
  final moneyVacuna = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: 'S/ ',
  );
  final moneyGrooming = new MoneyMaskedTextController(
    initialValue: 0,
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
    leftSymbol: 'S/ ',
  );
}
