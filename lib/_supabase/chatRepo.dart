import 'chatApi.dart';
import 'model/canalModel.dart';
import 'model/messageModel.dart';

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

  Future<int> getEstablishment(String uuid, String name) {
    return _api.getEstablishment(uuid, name);
  }
}
