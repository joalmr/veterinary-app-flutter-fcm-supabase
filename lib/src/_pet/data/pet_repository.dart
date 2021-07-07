import '_pet_interface.dart';
import 'model/pet_client.dart';
import 'model/pet_client_history.dart';
import 'pet_api.dart';

class PetClientRepository extends PetClientInterface {
  final _api = PetClientApi();

  @override
  Future<PetClient> getPet(String petId) {
    return _api.getPet(petId);
  }

  @override
  Future<PetClientHistory> getPetHistory(String petId) {
    return _api.getPetHistory(petId);
  }
}
