import 'package:get/get.dart';
import 'package:vet_app/_supabase/services/auth/petlover.repo.dart';
import 'package:vet_app/src/userClients/data/clients_repository.dart';
import 'package:vet_app/src/userClients/data/model/find_user_model.dart';

class FindClientsController extends GetxController {
  final _repo = ClientsRepository();

  final findClient = Rxn<ResultFindUser>();

  final userIdSupabase = 0.obs;

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  findClients(String mailUser) async {
    final response = await _repo.findUser(mailUser);
    findClient.value = response?.result;
    userIdSupabase.value = await PetloverRepo().getPetlover(
      findClient.value!.id!,
      findClient.value!.name!,
      findClient.value!.lastname!,
    );
  }
}
