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
import 'package:homesta/features/cart/data/repos/cart_repo_impl.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

// Chat
import 'package:homesta/features/chat/data/repos/chat_repo_impl.dart';
import 'package:homesta/features/chat/domain/repos/chat_repo.dart';

// Auth
import 'package:homesta/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:homesta/features/authentication/data/repositories/auth_repository.dart';
import 'package:homesta/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/my_store_use_case.dart';

import 'features/account/presentation/cubit/edit_profile_cubit.dart';
import 'features/order/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'features/seller/profile/presentation/cubits/store_cubit.dart';

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
            BlocProvider(create: (context) => sl<ProductCubit>()..getAllProducts()),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit(authRepo,myStoreUseCase:  sl<MyStoreUseCase>())),
          BlocProvider<AddItemToCartCubit>(
            create:
                (context) =>
                    AddItemToCartCubit(CartRepoImpl(apiConsumer: apiConsumer)),
          ),
          BlocProvider<CartCubit>(
            create:
                (context) => CartCubit(CartRepoImpl(apiConsumer: apiConsumer)),
          ),
          BlocProvider<EditProfileCubit>( create: (context) => sl<EditProfileCubit>(),),
          BlocProvider<ProductCubit>( create: (context) => sl<ProductCubit>()..getAllProducts(), ),
          BlocProvider<StoreCubit>(
            create: (context) => sl<StoreCubit>()..getAllStores(),
          ),
          BlocProvider<UserOrdersCubit>( create: (context) => sl<UserOrdersCubit>()..getUserOrders(), ),
          BlocProvider(create: (context) => sl<GetProductImagesCubit>()),
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
