import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Home Screen')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRouter.chatScreen);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
