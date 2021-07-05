import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/app/menu.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/components/dont_exit.dart';
import 'package:vet_app/src/chat/domain/chatController.dart';

class ChatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      init: ChatController(),
      builder: (_) {
        return DontExit(
          child: Scaffold(
            drawer: MenuDrawer(),
            appBar: AppBar(
              title: Text('Chats'),
            ),
            body: ListView.builder(
              itemCount: _.chats.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = _.chats[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InkWell(
                    onTap: () => _.goToMessage(chat.id!),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.person, color: Colors.white),
                            backgroundColor: colorMain.withOpacity(0.6),
                          ),
                          SizedBox(width: 10),
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
