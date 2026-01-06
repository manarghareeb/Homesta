import 'package:homesta/features/chat/data/models/chat_messages_history.dart';

class ChatMessageModel {
  final String firstQuestion;
  final List<ChatMessagesHistory> messages;

  ChatMessageModel({required this.firstQuestion, required this.messages});

  factory ChatMessageModel.fromJson(
    Map<String, dynamic> json,
    String userMessage,
  ) {
    String currentTime() {
      final now = DateTime.now();
      final hour = now.hour > 12 ? now.hour - 12 : now.hour;
      final period = now.hour >= 12 ? 'PM' : 'AM';
      return "${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period";
    }

    return ChatMessageModel(
      firstQuestion: userMessage,
      messages: [
        ChatMessagesHistory(
          text: userMessage,
          isUser: true,
          sender: "User",
          time: currentTime(),
        ),
        ChatMessagesHistory(
          text: json['response'],
          isUser: false,
          sender: "AI",
          time: currentTime(),
        ),
      ],
    );
  }
}
