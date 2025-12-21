import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/chat/data/models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: message.isUser ? null : ColorManager.buttonColor,
          gradient:
              message.isUser
                  ? LinearGradient(
                    colors: [
                      ColorManager.startchatColor,
                      ColorManager.buttonColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  : null,
          borderRadius:
              message.isUser
                  ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(5),
                  )
                  : const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(4),
                  ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          message.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
