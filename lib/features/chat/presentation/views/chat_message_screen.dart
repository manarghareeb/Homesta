import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/chat/data/models/chat_messages_history.dart';
import 'package:homesta/features/chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:homesta/features/chat/presentation/cubit/chat/chat_state.dart';
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
  final List<ChatMessagesHistory> initialMessages;

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();

  Color backgroundColor = ColorManager.aliceBlue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxHeight < 700;

        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: true,
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
                /// APP BAR
                AppBarWidget(
                  openDrawer: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),

                SizedBox(height: isSmall ? 12.h : 24.h),

                /// CHAT LIST
                Expanded(
                  child: BlocConsumer<ChatCubit, ChatState>(
                    listener: (context, state) {
                      if (state is ChatError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.error,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final messages = context.read<ChatCubit>().messages;

                      return ListView.builder(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          bottom: 12.h,
                        ),
                        reverse: false,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return MessageBubble(msg: messages[index]);
                        },
                      );
                    },
                  ),
                ),

                /// INPUT FIELD
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SendMessageWidget(
                    controller: controller,
                    onSend: () {
                      final message = controller.text.trim();
                      if (message.isNotEmpty) {
                        context.read<ChatCubit>().sendMessage(message);
                        controller.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
