import 'package:flutter/material.dart';
import 'widgets/AIImageSection.dart';
import 'widgets/ChatHeaderBubble.dart';
import 'widgets/StartChatButton.dart' show StartChatButton;
import 'widgets/TitleSection.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerSwipeAnimation() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final topPadding = screenHeight * 0.08;
    final contentSpacing = screenHeight * 0.04;
    final bottomPadding = screenHeight * 0.06;

    return Scaffold(
      backgroundColor: const Color(0xFFE8EDF5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: StartChatButton(
          onSwipeRight: () {
            _triggerSwipeAnimation();
            print("Swiped Right! Start Chat now...");
          },
          onSwipeLeft: () {
            _triggerSwipeAnimation();
            print("Swiped Left! Maybe cancel?");
          },
        ),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/AI_back.jpg", fit: BoxFit.cover),
          ),
          const ChatHeaderBubble(),
          SlideTransition(
            position: _offsetAnimation,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: topPadding),
                  AIImageSection(),
                  SizedBox(height: contentSpacing * 2),
                  TitleSection(),
                  SizedBox(height: contentSpacing),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
