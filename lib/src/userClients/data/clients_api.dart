import 'dart:convert';
import 'package:vet_app/config/variables_global.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/src/userClients/data/model/request/petlover.dart';
import 'package:vet_app/src/userClients/data/model/species_model.dart';
import 'package:vet_app/src/userClients/data/model/request/pet.dart';
import 'package:vet_app/src/userClients/data/model/client_user_model.dart';
import 'package:vet_app/src/userClients/data/model/breed_model.dart';
import '_clients_interface.dart';
import 'model/clients_model.dart';
import 'model/find_user_model.dart';

class ClientsApi extends ClientsInterface {
  @override
  Future<ClientsModel> getMyCLients(String establishment) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/clients',
    );

    final http.Response response = await http.get(url, headers: headersToken());

    final clients = clientsModelFromJson(response.body);

    return clients;
  }

  @override
  Future<dynamic> createBooking(String establishment, String bookingAt,
      String petId, List<int> typeId, String userId) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/booking',
    );

    final dataBooking = {
      'booking_at': bookingAt,
      'pet_id': petId,
      'type_id': typeId.toString(),
      'user_id': userId,
    };

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(dataBooking),
    );

    return response.body;
  }

  @override
  Future<FindUserModel> findUser(String mailUser) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/users',
      {'email': mailUser},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    final user = findUserModelFromJson(response.body);

    return user;
  }

  @override
  Future<FindUserModel> getUser(String userId) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/user/$userId',
    );

    final http.Response response = await http.get(url, headers: headersToken());
    final user = findUserModelFromJson(response.body);

    return user;
  }

  ////////////////
  ///
  @override
  Future<UserClientModel> getUserClient(
      String establishment, String user) async {
    final url = Uri.https(
        urlBase!, '$pathBase/establishment/$establishment/client/$user');

    final http.Response response = await http.get(url, headers: headersToken());
    
    final userClient = userClientModelFromJson(response.body);

    return userClient;
  }

  @override
  Future<List<Breed>> getBreeds(int specie) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/breeds',
      {'specie': specie.toString()},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    final breeds = breedsModelFromJson(response.body);

    return breeds.breeds!;
  }

  @override
  Future<List<Species>> getSpecies() async {
    final url = Uri.https(urlBase!, '$pathBase/species');

    final http.Response response = await http.get(url, headers: headersToken());
    final species = speciesModelFromJson(response.body);

    return species.species!;
  }

  @override
  Future<dynamic> insertPet(PetModelReq addpet) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/pet',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: petModelToJson(addpet),
    );

    return response.body;
  }

  @override
  Future<dynamic> insertPetlover(
      CreatePetloverReq addPetlover, String establishment) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/petlover',
    );

    final response = await http.post(
      url,
      headers: headersToken(),
      body: createPetloverReqToJson(addPetlover),
    );

    return response.body;
  }
}
