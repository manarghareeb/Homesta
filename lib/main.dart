import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/api/dio_consumer.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/features/chat/data/repos/chat_repo_impl.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  final dio = Dio();
  final apiConsumer = DioConsumer(dio: dio);
  final chatRepo = ChatRepoImpl(apiConsumer: apiConsumer);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChatRepo>.value(value: chatRepo),
      ],
      child: const MyApp(),
    ),
  );
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

