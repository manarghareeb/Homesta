import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/chat/presentation/widgets/ai_image_section.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_header_bubble.dart';
import 'package:homesta/features/chat/presentation/widgets/feature_tag_widget.dart';
import 'package:homesta/features/chat/presentation/widgets/start_chat_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EDF5),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/AI_back.jpg", fit: BoxFit.cover),
          ),
          const ChatHeaderBubble(),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 32.h),
                const AIImageSection(),
                SizedBox(height: 32.h),
                RichText(
                  text: TextSpan(
                    text: 'Your ',
                    style: TextStyles.font16WhiteW500.copyWith(fontSize: 40.sp),
                    children: [
                      TextSpan(
                        text: "AI Assistant ",
                        style: TextStyles.font16WhiteW500.copyWith(
                          fontSize: 40.sp,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Experience Smart & Secure AI chat",
                  textAlign: TextAlign.center,
                  style: TextStyles.font16DeepGeyColorRegular,
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FeatureTagWidget(title: "Smart Conversations"),
                    SizedBox(width: 24.w),
                    const FeatureTagWidget(title: "Instant Responses"),
                  ],
                ),
                SizedBox(height: 16.h),
                const FeatureTagWidget(title: "Secure & Private"),
                SizedBox(height: 16.h),
                const StartChatButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
