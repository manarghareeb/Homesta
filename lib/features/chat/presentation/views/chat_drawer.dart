import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/chat/data/models/chat_messages_history.dart';
import 'package:homesta/features/chat/data/models/chat_message_model.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_drawer_footer.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_drawer_header_section.dart';

class ChatDrawer extends StatefulWidget {
  const ChatDrawer({super.key});

  @override
  State<ChatDrawer> createState() => _ChatDrawerState();
}

class _ChatDrawerState extends State<ChatDrawer> {
  final List<ChatMessageModel> chats = [
    ChatMessageModel(
      firstQuestion: "Hi, how are you?",
      messages: [
        ChatMessagesHistory(
          text: "Hi, how are you?",
          isUser: true,
          sender: "User",
          time: "02:00 PM",
        ),
        ChatMessagesHistory(
          text: "I'm fine, thanks.",
          isUser: false,
          sender: "AI",
          time: "02:01 PM",
        ),
      ],
    ),
    ChatMessageModel(
      firstQuestion: "What's the weather today?",
      messages: [
        ChatMessagesHistory(
          text: "What's the weather today?",
          isUser: true,
          sender: "User",
          time: "10:30 AM",
        ),
        ChatMessagesHistory(
          text: "It's sunny.",
          isUser: false,
          sender: "AI",
          time: "10:31 AM",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 360;

        return Drawer(
          backgroundColor: ColorManager.aliceBlue,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/images/chat_ai_icon.svg',
                            height: isSmall ? 24 : 28,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      const ChatDrawerHeaderSection(),
                    ],
                  ),
                ),

                /// CHAT LIST
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      final chat = chats[index];
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          context.push(
                            AppRouter.chatMessageScreen,
                            extra: chat,
                          );
                        },
                        title: Text(
                          chat.firstQuestion,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font12GreyColorW400.copyWith(
                            fontSize: isSmall ? 12 : 13,
                            color: ColorManager.blackColor,
                          ),
                        ),
                        trailing: const Icon(Icons.more_vert, size: 20),
                      );
                    },
                  ),
                ),

                const ChatDrawerFooter(),
              ],
            ),
          ),
        );
      },
    );
  }
}
