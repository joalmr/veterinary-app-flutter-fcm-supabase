import 'model/breed_model.dart';
import 'model/client_user_model.dart';
import 'model/clients_model.dart';
import 'model/find_user_model.dart';
import 'model/request/pet.dart';
import 'model/request/petlover.dart';
import 'model/species_model.dart';

abstract class ClientsInterface {
  Future<ClientsModel> getMyCLients(String establishment);
  Future<dynamic> createBooking(
    String establishment,
    String bookingAt,
    String petId,
    List<int> typeId,
    String userId,
  );
  Future<FindUserModel> getUser(String userId);
  Future<FindUserModel> findUser(String mailUser);
  Future<UserClientModel> getUserClient(String establishment, String user);
  Future<List<Species>> getSpecies();
  Future<List<Breed>> getBreeds(int specie);
  Future<dynamic> insertPet(PetModelReq addpet);
  Future<dynamic> insertPetlover(
      CreatePetloverReq addPetlover, String establishment);
}
