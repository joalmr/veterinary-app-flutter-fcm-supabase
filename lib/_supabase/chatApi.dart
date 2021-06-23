import 'package:supabase/supabase.dart';
import 'model/canalModel.dart';
import 'model/messageModel.dart';
import '../config/variablesSupabase.dart';

class ChatApi {
  final supabaseClient = SupabaseClient(urlSupa, keySupa);

  Future<int> addEstablishment(String uuid, String name) async {
    final response = await supabaseClient.from('establishment').insert([
      {
        'vet_id': uuid,
        'name': name,
      }
    ]).execute();

    print('addEstablishment');
    print(response.status);
    print(response.data);

    final dato = response.data as List;
    return dato.first['id'];
  }

  Future<int> getEstablishment(String uuid, String name) async {
    int idVet;

    final hasVet = await supabaseClient
        .from('establishment')
        .select()
        .eq('vet_id', uuid)
        .single()
        .execute();

    print('getEstablishment');
    print(hasVet.status);
    print(hasVet.data);

    if (hasVet.data == null) {
      idVet = await addEstablishment(uuid, name);
    } else {
      idVet = hasVet.data['id'];
    }

    return idVet;
  }

  Future<List<CanalModel>> getCanal(int vetInt) async {
    List<CanalModel> canales = [];

    final hasCanal = await supabaseClient.from('canal').select('''
      *,
      petlover (
        *
      )
      ''').eq('establishment_id', vetInt).execute();

    print('getCanal');
    print(hasCanal.status);
    print(hasCanal.data);

    if (hasCanal.data != null) {
      final canalList = hasCanal.data as List;
      canales = canalList.map((e) => CanalModel.fromJson(e)).toList();
    }

    return canales;
  }

  Future<List<MessageModel>> getMessages(int canalId) async {
    List<MessageModel> mensajes = [];

    final messages = await supabaseClient
        .from('message')
        .select()
        .eq('canal_id', canalId)
        .execute();

    print('getMessages');
    print(messages.status);
    print(messages.data);

    if (messages.data != null) {
      final messageList = messages.data as List;
      mensajes = messageList.map((e) => MessageModel.fromJson(e)).toList();
    }

    return mensajes;
  }

  Future<void> addMessage(int canalId, String message) async {
    final response = await supabaseClient.from('message').insert([
      {
        'canal_id': canalId,
        'message': message,
        'type': false,
      }
    ]).execute();

    print('addMessage');
    print(response.status);
    print(response.data);
  }
}
