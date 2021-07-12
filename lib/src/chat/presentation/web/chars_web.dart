import 'package:flutter/material.dart';
import 'package:vet_app/components/web/navbar/navigation_bar.dart';
import 'package:vet_app/src/chat/presentation/app/chats_view.dart';

class ChatsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NavigationBar(),
          Expanded(
            child: ChatsView(),
          ),
        ],
      ),
    );
  }
}
