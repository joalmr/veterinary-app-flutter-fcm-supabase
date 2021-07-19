import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:vet_app/src/_pet/data/model/pet_client.dart';
import 'package:vet_app/src/_pet/data/model/pet_client_history.dart';
import 'package:vet_app/src/_pet/data/pet_repository.dart';

class PetHistoryLogic extends GetxController {
  final _repo = PetClientRepository();

  final petData = PetClient().obs;
  final petHistory = PetClientHistory().obs;

  final loadingPage = true.obs;

  @override
  Future<void> onReady() async {
    petData.value = await _repo.getPet(Get.arguments);
    petHistory.value = await _repo.getPetHistory(Get.arguments);
    loadingPage.value = false;

    print('historias');
    log(jsonEncode(petHistory.value.result!.first.details));
    super.onReady();
  }
}
