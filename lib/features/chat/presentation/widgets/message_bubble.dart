import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/chat/data/models/chat_messages_history.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessagesHistory msg;

  const MessageBubble({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment:
            msg.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                msg.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AI icon
              if (!msg.isUser) ...[
                CircleAvatar(
                  radius: 14.r,
                  backgroundColor: ColorManager.primaryColor,
                  child: Icon(
                    FontAwesomeIcons.robot,
                    color: Colors.white,
                    size: 12.sp,
                  ),
                ),
                SizedBox(width: 8.w),
              ],
              // Chat bubble
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    gradient:
                        msg.isUser
                            ? LinearGradient(
                              colors: [
                                ColorManager.startchatColor,
                                ColorManager.primaryColor,
                              ],
                              stops: const [0.0, 0.9],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                            : null,
                    color: msg.isUser ? null : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                      bottomLeft:
                          msg.isUser ? Radius.circular(16.r) : Radius.zero,
                      bottomRight:
                          msg.isUser ? Radius.zero : Radius.circular(16.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    border: Border.all(
                      color: msg.isUser ? Colors.white : Colors.transparent,
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    msg.text,
                    style: TextStyles.font12PiramyColorW400.copyWith(
                      color:
                          msg.isUser ? Colors.white : ColorManager.primaryColor,
                    ),
                  ),
                ),
              ),
              // User icon
              if (msg.isUser) ...[
                SizedBox(width: 8.w),
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.primaryColor,
                        ColorManager.startchatColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.9],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              ],
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.h,
              left: msg.isUser ? 0 : 40.w,
              right: msg.isUser ? 40.w : 0,
            ),
            child: Text(msg.time, style: TextStyles.font13BlackColorW400),
          ),
        ],
      ),
    );
  }
}
