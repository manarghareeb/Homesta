import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Setting'),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
              GoRouter.of(context).push(AppRouter.contactUsScreen);
            }, 
            child: Text('Contact Us')
          ),
          SizedBox(height: 16,),
          TextButton(
            onPressed: (){
              GoRouter.of(context).push(AppRouter.fAQsScreen);
            }, 
            child: Text('FAQS')
          ),
        ],
      ),
    );
  }
}