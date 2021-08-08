import 'package:vet_app/src/userClients/data/model/request/petlover.dart';
import 'package:vet_app/src/userClients/data/model/petlover_model.dart';
import 'package:vet_app/src/userClients/data/model/species_model.dart';
import 'package:vet_app/src/userClients/data/model/request/pet.dart';
import 'package:vet_app/src/userClients/data/model/client_user_model.dart';
import 'package:vet_app/src/userClients/data/model/breed_model.dart';
import '_clients_interface.dart';
import 'clients_api.dart';
import 'model/clients_model.dart';
import 'model/find_user_model.dart';

class ClientsRepository extends ClientsInterface {
  final _api = ClientsApi();

  @override
  Future<ClientsModel> getMyCLients(String establishment) {
    return _api.getMyCLients(establishment);
  }

  @override
  Future<dynamic> createBooking(String establishment, String bookingAt,
      String petId, List<int> typeId, String userId) {
    return _api.createBooking(establishment, bookingAt, petId, typeId, userId);
  }

  @override
  Future<FindUserModel> findUser(String mailUser) {
    return _api.findUser(mailUser);
  }

  @override
  Future<FindUserModel> getUser(String userId) {
    return _api.getUser(userId);
  }

  @override
  Future<List<Breed>> getBreeds(int specie) {
    return _api.getBreeds(specie);
  }

  @override
  Future<List<Species>> getSpecies() {
    return _api.getSpecies();
  }

  @override
  Future<UserClientModel> getUserClient(String establishment, String user) {
    return _api.getUserClient(establishment, user);
  }

  @override
  Future insertPet(PetModelReq addpet) {
    return _api.insertPet(addpet);
  }

  @override
  Future<dynamic> insertPetlover(
      CreatePetloverReq addPetlover, String establishment) {
    return _api.insertPetlover(addPetlover, establishment);
  }
}
