import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Outfit', 
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.w500,
            ),
            labelLarge: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.route,
      ),
    );
  }
}

