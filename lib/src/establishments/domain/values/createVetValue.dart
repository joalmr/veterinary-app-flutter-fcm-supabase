import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vet_app/src/establishments/data/model/serviceModel.dart';

class CreateVetValue {
  RxBool _checked = false.obs;
  bool get checked => _checked.value;
  set checked(bool value) => _checked.value = value;

  RxString _idVet = ''.obs;
  String get idVet => _idVet.value;
  set idVet(String value) => _idVet.value = value;

  RxInt _selected = 1.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected.value = value;

  RxString _description = ''.obs;
  String get description => _description.value;
  set description(String value) => _description.value = value;

  RxString _vetType = '1'.obs;
  String get vetType => _vetType.value;
  set vetType(String value) => _vetType.value = value;

  RxString _personalType = '2'.obs;
  String get personalType => _personalType.value;
  set personalType(String value) => _personalType.value = value;

  RxList<ServiceVetModel> servicesVet = <ServiceVetModel>[].obs;
  RxList<int> servicesVetSet = <int>[].obs;

  RxList<String> errorDays = <String>[].obs;

  RxList<Marker> marcador = <Marker>[].obs;

  List<TextEditingController> iniController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> endController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  RxList<bool> checkDay = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  RxList<String> iniDay = <String>[
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
    '07:00',
  ].obs;

  RxList<String> endDay = <String>[
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
