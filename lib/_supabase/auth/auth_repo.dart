import 'package:vet_app/_supabase/auth/auth_api.dart';

class AuthSupaRepo {
  final _api = AuthApi();

  Future<int> getEstablishment(String uuid, String name) {
    return _api.getEstablishment(uuid, name);
  }
}
