import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/chat/data/models/chat_messages_history.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';
import 'package:homesta/features/chat/presentation/cubit/chat/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());
  final ChatRepo chatRepo;
  List<ChatMessagesHistory> messages = [];

  String formattedTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return "${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period";
  }

  Future sendMessage(String message) async {
    messages.add(
      ChatMessagesHistory(
        text: message,
        isUser: true,
        sender: "User",
        time: formattedTime(),
      ),
    );
    emit(ChatLoading(messages));
    try {
      var response = await chatRepo.sendMessage(message);
      messages.add(
        ChatMessagesHistory(
          text: response.messages.last.text,
          isUser: false,
          sender: "AI",
          time: formattedTime(),
        ),
      );
      emit(ChatSuccess(List.from(messages)));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
