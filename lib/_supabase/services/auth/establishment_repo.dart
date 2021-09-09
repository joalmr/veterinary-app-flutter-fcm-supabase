import 'package:vet_app/_supabase/services/auth/establishment_api.dart';

class AuthSupaRepo {
  final _api = AuthEstablishmentApi();

  Future<int> getEstablishment(String uuid, String name) {
    return _api.getEstablishment(uuid, name);
  }
}
