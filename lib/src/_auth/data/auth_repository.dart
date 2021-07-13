import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/config/variables_global.dart';
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
  Future<int> forgotPassword(String email) async {
    print(email);
    final url = Uri.https(urlBase!, '/api/password/reset');
    final emailData = {'email': email};
    final response = await http.post(url, body: emailData);
    print(response.statusCode);
    return response.statusCode;
  }
}
