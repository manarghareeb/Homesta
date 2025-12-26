import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/chat/data/models/chat_message.dart';
import 'package:homesta/features/chat/data/models/chat_model.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_drawer_footer.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_drawer_header_section.dart';

class ChatDrawer extends StatefulWidget {
  const ChatDrawer({super.key});

  @override
  State<ChatDrawer> createState() => _ChatDrawerState();
}

class _ChatDrawerState extends State<ChatDrawer> {
  List<ChatModel> chats = [
    ChatModel(
      firstQuestion: "Hi, how are you?",
      messages: [
        ChatMessage(
          text: "Hi, how are you?",
          isUser: true,
          sender: "User",
          time: "02:00 PM",
        ),
        ChatMessage(
          text: "I'm fine, thanks.",
          isUser: false,
          sender: "AI",
          time: "02:01 PM",
        ),
      ],
    ),
    ChatModel(
      firstQuestion: "What's the weather today?",
      messages: [
        ChatMessage(
          text: "What's the weather today?",
          isUser: true,
          sender: "User",
          time: "10:30 AM",
        ),
        ChatMessage(
          text: "It's sunny.",
          isUser: false,
          sender: "AI",
          time: "10:31 AM",
        ),
      ],
    ),
    ChatModel(
      firstQuestion: "Tell me a joke",
      messages: [
        ChatMessage(
          text: "Tell me a joke",
          isUser: true,
          sender: "User",
          time: "04:20 PM",
        ),
        ChatMessage(
          text: "Why did the chicken cross the road?",
          isUser: false,
          sender: "AI",
          time: "04:21 PM",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.aliceBlue,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/chat_ai_icon.svg'),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  const ChatDrawerHeaderSection(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.chatMessageScreen,
                          extra: chat,
                        );
                      },
                      title: Text(
                        chat.firstQuestion,
                        style: TextStyles.font12GreyColorW400.copyWith(
                          color: ColorManager.blackColor,
                        ),
                      ),
                      trailing: const Icon(Icons.more_vert, size: 20),
                    ),
                  );
                },
              ),
            ),
            const ChatDrawerFooter(),
          ],
        ),
      ),
    );
  }
}
