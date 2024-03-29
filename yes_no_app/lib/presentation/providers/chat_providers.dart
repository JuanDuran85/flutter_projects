import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Nuevo mensaje', fromWho: FromWho.me),
    Message(text: 'Es un nuevo mensaje?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {}
}
