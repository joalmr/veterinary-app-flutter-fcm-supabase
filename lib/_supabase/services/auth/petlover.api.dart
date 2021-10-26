import 'package:supabase/supabase.dart';
import 'package:vet_app/config/variables_supabase.dart';

class PetloverApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  Future<int> addPetlover(
    String uuidPetlover,
    String name,
    String lastname,
  ) async {
    final response = await supabaseClient.from('petlover').insert([
      {
        'user_id': uuidPetlover,
        'name': '$name $lastname',
      }
    ]).execute();

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<int> getPetlover(
    String uuidPetlover,
    String name,
    String lastname,
  ) async {
    int idPetlover;

    final hasPetlover = await supabaseClient
        .from('petlover')
        .select()
        .eq('user_id', uuidPetlover)
        .single()
        .execute();

    if (hasPetlover.data == null) {
      idPetlover = await addPetlover(uuidPetlover, name, lastname);
    } else {
      idPetlover = hasPetlover.data['id'];
    }

    return idPetlover;
  }
}
