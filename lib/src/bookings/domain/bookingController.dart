import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/buttons.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/bookings/presentation/widgets/dataNextdate.dart';

class BookingController extends GetxController {

  RxString condicion = "".obs;

  RxBool statusBooking = false.obs;

  RxList<dynamic> listSet = <dynamic>[].obs;
  RxList<DataNextdate> listNextdate = <DataNextdate>[].obs;

  String petId;
  String specie;
  String breed;
  String name;
  String image;
  String birthday;

  @override
    void onInit() {
      super.onInit();
      petId = Get.arguments['petId'];
      specie = Get.arguments['specie'];
      breed = Get.arguments['breed'];
      name = Get.arguments['name'];
      image = Get.arguments['image'];
      birthday = Get.arguments['birthday'];
      print(name);
    }
  @override
  void onClose() {
    if(Get.context.width<900)
      Get.close(1);
    super.onClose();
  }

  void add2List(dynamic dato) {
    if (!listSet.contains(dato)){
      listSet.add(dato);
      var temp = DataNextdate(
        type: dato['type'],
        name: dato['name'],
        date: formatDateBasic(DateTime.now()),
        observation: '-'
      );
      listNextdate.add(temp);
    }
      
    else {
      Get.dialog(
        AlertDialog(
          title: Text('Eliminar'),
          content: Text('Seguro que desea eliminar próxima cita de ${dato['name']}?'),
          actions: <Widget>[
            btnAltern(
              text: 'Cancelar',
              onPressed: () => Get.back(),
            ),
            btnAltern(
              text: 'Eliminar', 
              onPressed: (){
                listSet.remove(dato);
                listNextdate.removeWhere((element) {
                  return element.name == dato['name'];
                });
                Get.back();
              },
              color: colorRed,
            ),
          ],
        ),
      );
    }
  }

}