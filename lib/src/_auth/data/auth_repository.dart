import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/header_http.dart';
import 'auth_interface.dart';

class AuthRepository extends AuthInterface {
  @override
  Future<int> logOut() async {
    try {
      prefUser.tokenDel();
      prefUser.vetDataDel();
      prefUser.userRolDel();
      return 200;
    } catch (_) {
      return 500;
    }
  }

  @override
  Future<int> login(String email, String password) async {
    final url = Uri.https(urlBase!, '/api/client/login');
    try {
      final loginData = {'email': email, 'password': password};

      final http.Response response = await http.post(url, body: loginData);

      if (response.statusCode == 200) {
        final jsonResp = json.decode(response.body);
        prefUser.token = jsonResp['token'];
        prefUser.userRol = jsonResp['rol'];
      }
      return response.statusCode;
    } catch (ex) {
      return 500;
    }
  }

  @override
  Future<void> sendTokenFire(String fireToken) async {
    final url = Uri.https(urlBase!, '/api/firebase');
    final fireData = {'token': fireToken};
    try {
      await http.post(
        url,
        headers: headersToken(),
        body: fireData,
      );
    } catch (ex) {
      print(ex);
      throw Exception(ex);
    }
  }

  @override
  Future<int> forgotPassword(String email) async {
    final url = Uri.https(urlBase!, '/api/password/reset');
    final emailData = {'email': email};
    final response = await http.post(url, body: emailData);

    return response.statusCode;
  }
}
