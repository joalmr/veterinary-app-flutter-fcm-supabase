import 'package:supabase/supabase.dart';
import 'package:vet_app/config/variables_supabase.dart';

class AuthApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  Future<int> getEstablishment(String uuid, String name) async {
    int idVet;

    final hasVet = await supabaseClient
        .from('establishment')
        .select()
        .eq('vet_id', uuid)
        .single()
        .execute();

    if (hasVet.data == null) {
      idVet = await addEstablishment(uuid, name);
    } else {
      idVet = hasVet.data['id'] as int;
    }

    return idVet;
  }

  Future<int> addEstablishment(String uuid, String name) async {
    final response = await supabaseClient.from('establishment').insert([
      {
        'vet_id': uuid,
        'name': name,
      }
    ]).execute();

    final dato = response.data as List;
    return dato.first['id'] as int;
  }
}
