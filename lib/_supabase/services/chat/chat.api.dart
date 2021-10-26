import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/model/canal.model.dart';
import 'package:vet_app/_supabase/model/message.model.dart';
import 'package:vet_app/config/variables_supabase.dart';

class ChatApi {
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  Future<List<CanalModel>> getCanal(int vetInt) async {
    List<CanalModel> canales = [];

    final hasCanal = await supabaseClient
        .from('canal')
        .select('''*, petlover (*)''')
        .eq('establishment_id', vetInt)
        .execute();

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

    if (messages.data != null) {
      final messageList = messages.data as List;
      mensajes = messageList.map((e) => MessageModel.fromJson(e)).toList();
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
