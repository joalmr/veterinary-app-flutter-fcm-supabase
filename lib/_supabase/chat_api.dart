import 'package:supabase/supabase.dart';

import '../config/variables_supabase.dart';
import 'model/canal_model.dart';
import 'model/message_model.dart';

class ChatApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

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

  Future<List<CanalModel>> getCanal(int vetInt) async {
    List<CanalModel> canales = [];

    final hasCanal = await supabaseClient
        .from('canal')
        .select('''*, petlover (*)''')
        .eq('establishment_id', vetInt)
        .execute();

    if (hasCanal.data != null) {
      final canalList = hasCanal.data as List;
      canales = canalList
          .map((e) => CanalModel.fromJson(e as Map<String, dynamic>))
          .toList();
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

    if (messages.data != null) {
      final messageList = messages.data as List;
      mensajes = messageList
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return mensajes;
  }

  Future<void> addMessage(int canalId, String message) async {
    await supabaseClient.from('message').insert([
      {
        'canal_id': canalId,
        'message': message,
        'type': false,
      }
    ]).execute();
  }
}
