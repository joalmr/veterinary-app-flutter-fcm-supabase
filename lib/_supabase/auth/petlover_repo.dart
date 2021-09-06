import 'package:vet_app/_supabase/auth/petlover_api.dart';

class PetloverRepo {
  final _api = PetloverApi();

  Future<int> getPetlover(String uuidPetlover, String name, String lastname) {
    return _api.getPetlover(uuidPetlover, name, lastname);
  }
}
