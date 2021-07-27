import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/userClients/data/clients_repository.dart';
import 'package:vet_app/src/userClients/data/model/clients_model.dart';

class ClientsController extends GetxController {
  final _repo = ClientsRepository();

  final loadClients = true.obs;

  final myClients = <ResultClients>[].obs;

  @override
  void onReady() {
    getClients();
    super.onReady();
  }

  getClients() async {
    if (prefUser.tokenHas() && prefUser.vetDataHas()) {
      loadClients.value = true;
      final response = await _repo.getMyCLients(prefUser.vetId!);

      myClients.clear();
      myClients.addAll(response.result!);

      loadClients.value = false;
    }
  }
}
