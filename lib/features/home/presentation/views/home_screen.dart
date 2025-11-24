import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.productDetailsScreen);
            },
            child: Text('Product Details Screen'),
          ),
        ],
      ),
    );
  }
}
