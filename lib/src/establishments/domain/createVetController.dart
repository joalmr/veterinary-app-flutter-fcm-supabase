import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vet_app/assets/utils/days/diaSemana.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:vet_app/src/establishments/data/request/establishmentRequest.dart';
import 'package:vet_app/src/establishments/data/request/priceEstRequest.dart';
import 'establishmentsController.dart';
import 'values/createVetValue.dart';
import 'package:flutter/services.dart' show rootBundle;

class CreateVetController extends GetxController {
  final establishmentRepo = EstablishmentRepository();
  final v = CreateVetValue();

  EstablecimientoEntity entity = new EstablecimientoEntity();
  PriceEstablecimientoEntity prices = new PriceEstablecimientoEntity();
  final establishmentController = Get.find<EstablishmentsController>();

  String _mapStyle;
  GoogleMapController _controller;

  String displayStringForOption(Prediction option) => option.name;

  @override
  void onInit() {
    super.onInit();
    _getService();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _getService() async {
    var lista = await establishmentRepo.getServiceVet();
    v.servicesVet.clear();
    v.servicesVet.addAll(lista);
  }

  mapCreated(controller) {
    _controller = controller;
    _controller.setMapStyle(_mapStyle);
  }

  void add2List(int numero) {
    if (!v.servicesVetSet.contains(numero))
      v.servicesVetSet.add(numero);
    else {
      if (v.servicesVetSet.length > 1) {
        v.servicesVetSet.remove(numero);
      }
    }
  }

  // onSearch(filter) async {
  //   Uri url = Uri.https(
  //     "maps.googleapis.com",
  //     "/maps/api/place/autocomplete/json?key=$keyMap&language=es&input=$filter",
  //   );
  //   var response = await http.get(url);
  //   var models = addressFromJson(response.body);
  //   return models.predictions;
  // }

  gpsDireccion(Prediction data) {
    _searchandNavigate(data);
  }

  _searchandNavigate(Prediction dato) async {
    if (v.dirVet.text.trim() != "") {
      // marcador.clear();
      // final places = new GoogleMapsPlaces(apiKey: keyMap);
      // final mapdata = await places.getDetailsByPlaceId(dato.placeId);

      v.dirVet.text = dato.name;
      entity.address = dato.name;
      update(['xmap']);
    }
  }

  _newEstablishment() async {
    entity.typeId = int.parse(v.vetType);
    // entity.address = "Misionero Salas, Callao, Perú";
    entity.latitude = -12.002784;
    entity.longitude = -77.100593;
    entity.services = v.servicesVetSet;
    entity.reference = "Cerca";

    // var resp =
    establishmentRepo.setNew(entity).then((value) async {
      v.idVet = value[1];
      print(v.idVet);
      await _setEmployee();
      await _setSchedule();
      await _setPrices();
      await _setDescription();
      establishmentController.getAll();
    });
  }

  _setEmployee() async {
    int type = int.parse(v.personalType);
    String name = v.personalNameVet.text;
    String code = v.personalCodeVet.text;
    await establishmentRepo.setEmployee(v.idVet, type, name, code);
  }

  _setPrices() async {
    prices.consultationPriceFrom = v.moneyConsulta.numberValue;
    prices.dewormingPriceFrom = v.moneyDesparasita.numberValue;
    prices.groomingPriceFrom = v.moneyGrooming.numberValue;
    prices.vaccinationPriceFrom = v.moneyVacuna.numberValue;

    await establishmentRepo.setPrices(v.idVet, prices);
  }

  _setSchedule() async {
    var schedule = {
      "monday": {
        "switch": v.checkDay[0],
        "time_start": v.iniDay[0],
        "time_end": v.endDay[0],
      },
      "tuesday": {
        "switch": v.checkDay[1],
        "time_start": v.iniDay[1],
        "time_end": v.endDay[1],
      },
      "wednesday": {
        "switch": v.checkDay[2],
        "time_start": v.iniDay[2],
        "time_end": v.endDay[2],
      },
      "thursday": {
        "switch": v.checkDay[3],
        "time_start": v.iniDay[3],
        "time_end": v.endDay[3],
      },
      "friday": {
        "switch": v.checkDay[4],
        "time_start": v.iniDay[4],
        "time_end": v.endDay[4],
      },
      "saturday": {
        "switch": v.checkDay[5],
        "time_start": v.iniDay[5],
        "time_end": v.endDay[5],
      },
      "sunday": {
        "switch": v.checkDay[6],
        "time_start": v.iniDay[6],
        "time_end": v.endDay[6],
      },
    };

    await establishmentRepo.setSchedule(v.idVet, schedule);
  }

  _setDescription() async {
    await establishmentRepo.setDescription(v.idVet, v.description);
  }

  setFinaliza() => _newEstablishment();

  //step 1
  bool get ename => v.nameVet.text.isEmpty;
  bool get ephone => v.phoneVet.text.isEmpty;
  bool get eruc => v.rucVet.text.isEmpty;
  bool get eweb => v.webVet.text.isEmpty;
  bool get eservices => v.servicesVetSet.length == 0;
  //step 2
  bool get edirVet => v.dirVet.text.isEmpty;
  //step 3
  bool get epersonalNameVet => v.personalNameVet.text.isEmpty;
  bool get epersonalCodeVet =>
      v.personalCodeVet.text.isEmpty && v.personalType == '2';
  bool get emoneyConsulta => v.moneyConsulta.text.isEmpty;
  bool get emoneyDesparasita => v.moneyDesparasita.text.isEmpty;
  bool get emoneyVacuna => v.moneyVacuna.text.isEmpty;
  bool get emoneyGrooming => v.moneyGrooming.text.isEmpty;
  //step 4
  bool get edescriptionVet => v.descriptionVet.text.isEmpty;

  validaStep1() {
    if (ename || ephone || eruc || eweb || eservices) {
      Get.snackbar(
        'Error',
        'Llene todos los campos',
        backgroundColor: colorRed.withAlpha(180),
        colorText: colorRed3,
      );
    } else {
      if (v.selected < 4) v.selected++;
    }
  }

  validaStep2() {
    if (edirVet) {
      Get.snackbar(
        'Error',
        'Llene los campos',
        backgroundColor: colorRed.withAlpha(180),
        colorText: colorRed3,
      );
    } else {
      if (v.selected < 4) v.selected++;
    }
  }

  validaStep3() {
    var diaError = "";
    var diaHoraError = "";
    for (var i = 0; i < 7; i++) {
      String ini = v.iniController[i].text;
      String end = v.endController[i].text;
      if (v.checkDay[i]) {
        if (ini.isEmpty || end.isEmpty) {
          diaError == ""
              ? diaError = diaError + diaSemana[i]
              : diaError = diaError + ", " + diaSemana[i];
        } else {
          int iniNum = int.parse(ini.split(':')[0]);
          int endNum = int.parse(end.split(':')[0]);
          if (iniNum >= endNum)
            diaHoraError =
                "Hora seleccionada incorrecta el día ${diaSemana[i]}, la hora de inicio es mayor a la de fin";
        }
      }
    }

    if (emoneyConsulta ||
        emoneyDesparasita ||
        emoneyVacuna ||
        emoneyGrooming ||
        epersonalNameVet ||
        epersonalCodeVet) {
      Get.snackbar(
        'Error',
        'Llene los campos',
        backgroundColor: colorRed.withAlpha(180),
        colorText: colorRed3,
      );
    } else if (diaError != "" || diaHoraError != "") {
      if (diaError != "")
        Get.snackbar(
          'Error',
          'Complete los datos de $diaError',
          backgroundColor: colorRed.withAlpha(180),
          colorText: colorRed3,
        );
      if (diaHoraError != "")
        Get.snackbar(
          'Error',
          '$diaHoraError',
          backgroundColor: colorRed.withAlpha(180),
          colorText: colorRed3,
        );
    } else {
      if (v.selected < 4) v.selected++;
    }
  }

  validaStep4() {
    if (edescriptionVet) {
      Get.snackbar(
        'Error',
        'Llene los campos',
        backgroundColor: colorRed.withAlpha(180),
        colorText: colorRed3,
      );
    } else {
      v.checked = true;
      setFinaliza();
      Timer(
        Duration(milliseconds: 3500),
        () {
          v.checked = false;
          Get.offNamed(NameRoutes.establishments);
        },
      );
    }
  }
}
