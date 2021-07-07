import '../model/pet_client.dart';
import '../model/pet_client_history.dart';

abstract class PetClientInterface {
  Future<PetClient> getPet(String petId);
  Future<PetClientHistory> getPetHistory(String petId);
}
