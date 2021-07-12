import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/chats_view.dart';
import 'web/chars_web.dart';

class ChatsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.width < 900 ? ChatsView() : ChatsWeb();
  }
}
