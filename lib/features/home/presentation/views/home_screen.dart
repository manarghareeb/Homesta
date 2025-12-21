import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: ColorManager.buttonColor,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.emptyNotificationScreen);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_off_outlined,
              color: ColorManager.buttonColor,
            ),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.notificationScreen);
            },
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.productDetailsScreen);
          },
          child: Text('Product Details'),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.chatScreen);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
