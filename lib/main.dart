import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/api/dio_consumer.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';

// Chat
import 'package:homesta/features/chat/data/repos/chat_repo_impl.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';

// Auth
import 'package:homesta/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:homesta/features/authentication/data/repositories/auth_repository.dart';
import 'package:homesta/features/authentication/presentation/cubit/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final dio = Dio();
  final apiConsumer = DioConsumer(dio: dio);

  // Chat repo
  final chatRepo = ChatRepoImpl(apiConsumer: apiConsumer);

  // Auth repo
  final authRemoteDataSource = AuthRemoteDataSource(apiConsumer);
  final authRepo = AuthRepository(authRemoteDataSource);

  initServiceLocator();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ChatRepo>.value(value: chatRepo),
        RepositoryProvider<AuthRepository>.value(value: authRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepo)),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final scale = (mediaQuery.size.width / 375).clamp(0.7, 1.2);

        return MediaQuery(
          data: mediaQuery.copyWith(textScaleFactor: scale),
          child: MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Outfit',
              textTheme: TextTheme(
                bodyLarge: TextStyles.font16BlackRegular,
                bodyMedium: TextStyles.font14BlackColorW400,
                bodySmall: TextStyles.font12GreyColorW400,
                titleLarge: TextStyles.font20BlackColorW500,
                titleMedium: TextStyles.font18BlackW500,
                titleSmall: TextStyles.font16BlackW500,
              ),
            ),
            routerConfig: AppRouter.route,
          ),
        );
      },
    );
  }
}
