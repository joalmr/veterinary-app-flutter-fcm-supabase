import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/design/layout/main_layout.dart';
import 'app/chats_view.dart';
import 'web/chats_web.dart';

class ChatsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      drawerActive: true,
      title: 'Chats',
      body: context.width < 900 ? ChatsView() : ChatsWeb(),
    );
  }
}
