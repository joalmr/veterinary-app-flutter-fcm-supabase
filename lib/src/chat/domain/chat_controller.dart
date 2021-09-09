import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:vet_app/_supabase/services/chat/chat_repo.dart';
import 'package:vet_app/_supabase/model/canal_model.dart';
import 'package:vet_app/_supabase/model/message_model.dart';
import 'package:vet_app/config/variables_supabase.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/chat/presentation/app/message_view.dart';

class ChatController extends GetxController {
  final _repo = ChatRepo();

  RxBool cargando = true.obs;
  RxList<CanalModel> chats = <CanalModel>[].obs;
  RxList<MessageModel> mensajes = <MessageModel>[].obs;

  int? canalId;

  RealtimeSubscription? subscriptionMessage;
  final supabaseClient = SupabaseClient(urlSupa!, keySupa!);

  @override
  Future<void> onInit() async {
    super.onInit();

    runSubscription();

    await getChats();
    cargando.value = false;
  }

  getChats() => _getChats();
  Future<void> _getChats() async {
    final response = await _repo.getCanal(prefUser.vetIdSupa);

    chats.clear();
    chats.addAll(response);
  }

  void goToMessage(int canal) {
    Get.to(MessagesView());
    //* lei mensaje
    _getMessage(canal);
  }

  Future<void> _getMessage(int canal) async {
    canalId = canal;
    final response = await _repo.getMessages(canal);

    mensajes.clear();
    mensajes.addAll(response);
  }

  addMessage(String message) => _addMessage(message);
  Future<void> _addMessage(String message) async {
    await _repo.addMessage(canalId!, message);
  }

  void runSubscription() {
    //* escucha mensaje
    subscriptionMessage =
        supabaseClient.from('message').on(SupabaseEventTypes.delete, (payload) {
      _getMessage(canalId!);
    }).on(SupabaseEventTypes.update, (payload) {
      //true =>
      _getMessage(canalId!);
    }).on(SupabaseEventTypes.insert, (payload) {
      _getMessage(canalId!);
    }).subscribe();

    //* escucha canal
    subscriptionMessage =
        supabaseClient.from('canal').on(SupabaseEventTypes.delete, (payload) {
      getChats();
    }).on(SupabaseEventTypes.update, (payload) {
      getChats();
    }).on(SupabaseEventTypes.insert, (payload) {
      getChats();
    }).subscribe();
  }
}
