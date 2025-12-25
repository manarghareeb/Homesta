import 'package:homesta/features/chat/data/models/chat_message.dart';

class ChatModel {
  final String firstQuestion;
  final List<ChatMessage> messages;

  ChatModel({
    required this.firstQuestion,
    required this.messages,
  });
}
