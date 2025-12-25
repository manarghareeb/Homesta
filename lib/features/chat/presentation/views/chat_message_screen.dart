import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/chat/data/models/chat_message.dart';
import 'package:homesta/features/chat/presentation/views/chat_drawer.dart';
import 'package:homesta/features/chat/presentation/widgets/app_bar_widget.dart';
import 'package:homesta/features/chat/presentation/widgets/message_bubble.dart';
import 'package:homesta/features/chat/presentation/widgets/send_message_widget.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({
    super.key,
    required this.chatTitle,
    required this.initialMessages,
  });
  final String chatTitle;
  final List<ChatMessage> initialMessages;

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();

  late List<ChatMessage> messages;

  Color backgroundColor = ColorManager.aliceBlue;

  @override
  void initState() {
    super.initState();
    messages = List.from(widget.initialMessages);
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;
    final userMsg = ChatMessage(
      text: controller.text.trim(),
      isUser: true,
      sender: "User",
      time: formattedTime(),
    );
    setState(() {
      messages.add(userMsg);
    });
    controller.clear();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add(
          ChatMessage(
            text: "This is an AI response",
            isUser: false,
            sender: "AI",
            time: formattedTime(),
          ),
        );
      });
    });
  }

  String formattedTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return "${hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      drawer: const ChatDrawer(),
      onDrawerChanged: (isOpen) {
        setState(() {
          backgroundColor = isOpen ? Colors.white : ColorManager.aliceBlue;
        });
      },
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(
              openDrawer: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(msg: messages[index]);
                },
              ),
            ),
            SendMessageWidget(
              controller: controller,
              onSend: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
