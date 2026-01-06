import 'package:homesta/features/chat/data/models/chat_message_model.dart';

abstract class ChatRepo {
  Future<ChatMessageModel> sendMessage(String message);
}
