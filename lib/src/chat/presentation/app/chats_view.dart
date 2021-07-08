import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/components/dont_exit.dart';
import 'package:vet_app/src/chat/domain/chat_controller.dart';

class ChatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      init: ChatController(),
      builder: (_) {
        return DontExit(
          child: Scaffold(
            drawer: const MenuDrawer(),
            appBar: AppBar(
              title: const Text('Chats'),
            ),
            body: ListView.builder(
              itemCount: _.chats.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = _.chats[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InkWell(
                    onTap: () => _.goToMessage(chat.id!),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colorMain.withOpacity(0.6),
                            child:
                                const Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [Text(chat.petlover?.name ?? '')],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
