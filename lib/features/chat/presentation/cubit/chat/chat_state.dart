import 'package:homesta/features/chat/data/models/chat_messages_history.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  final List<ChatMessagesHistory> messages;
  ChatLoading(this.messages);
}

class ChatSuccess extends ChatState {
  final List<ChatMessagesHistory> messages;
  ChatSuccess(this.messages);
}

class ChatError extends ChatState {
  final String error;

  ChatError(this.error);
}
