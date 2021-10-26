import 'package:vet_app/_supabase/model/canal.model.dart';
import 'package:vet_app/_supabase/model/message.model.dart';

import 'chat.api.dart';

class ChatRepo {
  final _api = ChatApi();

  Future<List<CanalModel>> getCanal(int vetInt) {
    return _api.getCanal(vetInt);
  }

  Future<List<MessageModel>> getMessages(int canalId) {
    return _api.getMessages(canalId);
  }

  Future<void> addMessage(int canalId, String message) {
    return _api.addMessage(canalId, message);
  }

  // Future<int> getEstablishment(String uuid, String name) {
  //   return _api.getEstablishment(uuid, name);
  // }
}
