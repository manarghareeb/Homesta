import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/chat/presentation/widgets/ai_image_section.dart';
import 'package:homesta/features/chat/presentation/widgets/chat_header_bubble.dart';
import 'package:homesta/features/chat/presentation/widgets/feature_tag_widget.dart';
import 'package:homesta/features/chat/presentation/widgets/start_chat_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxHeight < 700;

        return Scaffold(
          backgroundColor: const Color(0xFFE8EDF5),
          body: Stack(
            children: [
              /// Background
              Positioned.fill(
                child: Image.asset(
                  "assets/images/AI_back.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              /// Header Bubble
              const ChatHeaderBubble(),

              /// Content
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: isSmall ? 24.h : 40.h),

                        /// AI Image
                        const AIImageSection(),

                        SizedBox(height: isSmall ? 20.h : 32.h),

                        /// Title
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Your ',
                            style: TextStyles.font16WhiteW500.copyWith(
                              fontSize: isSmall ? 28.sp : 36.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'AI Assistant',
                                style: TextStyles.font16WhiteW500.copyWith(
                                  fontSize: isSmall ? 28.sp : 36.sp,
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.h),

                        /// Subtitle
                        Text(
                          "Experience Smart & Secure AI chat",
                          textAlign: TextAlign.center,
                          style: TextStyles.font16DeepGeyColorRegular.copyWith(
                            fontSize: isSmall ? 13.sp : 15.sp,
                          ),
                        ),

                        SizedBox(height: isSmall ? 24.h : 36.h),

                        /// Feature Tags
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16.w,
                          runSpacing: 12.h,
                          children: const [
                            FeatureTagWidget(title: "Smart Conversations"),
                            FeatureTagWidget(title: "Instant Responses"),
                            FeatureTagWidget(title: "Secure & Private"),
                          ],
                        ),

                        SizedBox(height: isSmall ? 28.h : 40.h),

                        /// Start Chat Button
                        const StartChatButton(),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
