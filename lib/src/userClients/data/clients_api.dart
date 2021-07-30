import 'dart:convert';

import 'package:vet_app/config/variables_global.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/header_http.dart';
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
    //booking_at -> fecha
    print('llega create');
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

    print(response.body);
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
}
