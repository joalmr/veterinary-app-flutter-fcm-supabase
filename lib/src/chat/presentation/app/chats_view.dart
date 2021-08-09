import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/chat/domain/chat_controller.dart';

class ChatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      init: ChatController(),
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GetPlatform.isWeb
            context.width > 900
                ? Container(
                    margin: const EdgeInsets.only(
                        left: 30.0, top: 25.0, bottom: 10.0),
                    child: const Text(
                      'Chats',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                : SizedBox(height: 0),
            Expanded(
              child: _.chats.isEmpty
                  ? Center(
                      child: Text('No tiene chats de petlovers'),
                    )
                  : ListView.builder(
                      itemCount: _.chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        final chat = _.chats[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
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
                                    child: const Icon(Icons.person,
                                        color: Colors.white),
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
          ],
        );
      },
    );
  }
}
