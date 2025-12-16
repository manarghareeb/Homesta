import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/chatmassage/widgets/chat_bubble.dart';
import 'package:homesta/features/chatmassage/widgets/next.dart';
import 'package:homesta/models/chat_message.dart';

class chat_mass_Screen extends StatefulWidget {
  const chat_mass_Screen({super.key});

  @override
  State<chat_mass_Screen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<chat_mass_Screen> {
  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'Hi, anyone can recommend someone to install my TV stand',
      isUser: false,
      sender: 'AI Chat',
    ),
    ChatMessage(
      text: 'Support Agent:\nYou can choose between Omar or Youssef',
      isUser: true,
      sender: 'Support',
    ),
    ChatMessage(text: "I'll choose Omar", isUser: false, sender: 'User'),
    ChatMessage(text: 'Omar ( Installer ):', isUser: true, sender: 'Omar'),
    ChatMessage(
      text:
          'Hi Maram, I can come tomorrow. The installation is 250 EGP. Is that okay?',
      isUser: true,
      sender: 'Omar',
    ),
    ChatMessage(text: "Yes, that's fine", isUser: false, sender: 'User'),
    ChatMessage(
      text: 'Omar ( Installer ):\nGreat! I\'ll be there at 2PM.',
      isUser: true,
      sender: 'Omar',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Text(
                        'AI ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.buttonColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover the latest AI technologies',
                    style: TextStyle(
                      fontSize: 13,
                      color: ColorManager.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final message = messages[index];
              return ChatBubble(message: message);
            }, childCount: messages.length),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                      children: [
                        const TextSpan(text: 'Ask any '),
                        TextSpan(
                          text: 'question',
                          style: TextStyle(color: Colors.teal[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Revolutionize your communication\nwith AI chat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorManager.greyColor,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(width: double.infinity, child: nextChatButton()),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
