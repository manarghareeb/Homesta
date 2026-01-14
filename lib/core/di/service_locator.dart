import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/dio_consumer.dart';
import 'package:homesta/features/cart/data/repos/cart_repo_impl.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:homesta/features/categories/data/datasources/category_data_source.dart';
import 'package:homesta/features/categories/data/repositories/category_repo_imp.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';
import 'package:homesta/features/categories/domain/usecases/get_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/get_sub_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/search_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/search_sub_category_use_case.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/order/data/repos/order_repo_impl.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/place_order_cubit/place_order_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/shipping_cubit/shipping_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/product_data_source.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/review_data_source.dart';
import 'package:homesta/features/product/data/repositories/product_repository_impl.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';
import 'package:homesta/features/product/domain/usecases/add_review_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_all_product_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_product_images_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_product_review_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_products_by_category_use_case%20.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/seller/product/data/data_source/saller_product_data_source.dart';
import 'package:homesta/features/seller/product/data/repo/saller_repo_impl.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';
import 'package:homesta/features/seller/product/domain/usecases/add_product_use_case.dart';
import 'package:homesta/features/seller/product/domain/usecases/get_saller_product_usecase.dart';
import 'package:homesta/features/seller/product/domain/usecases/upload_product_images_use_case.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_cubit.dart';
import 'package:homesta/features/seller/product/presentation/cubits/upload_image_cubit/upload_image_cubit.dart';
import 'package:homesta/features/seller/profile/data/data_source/store_data_source.dart';
import 'package:homesta/features/seller/profile/data/repo/store_repo_impl.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/create_store_use_case.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/get_store_use_case.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_cubit.dart';

import '../../features/account/data/datasources/user_data_source.dart';
import '../../features/account/data/repositories/user_repo_impl.dart';
import '../../features/account/domain/repositories/user_repo.dart';
import '../../features/account/domain/usecases/update_user_use_case.dart';
import '../../features/account/presentation/cubit/edit_profile_cubit.dart';
import '../../features/admin/domain/usecases/add_category_use_case.dart';
import '../../features/admin/domain/usecases/add_subCategory_use_case.dart';
import '../../features/admin/domain/usecases/delete_category_use_case.dart';
import '../../features/admin/domain/usecases/delete_sub_category_use_case.dart';
import '../../features/admin/domain/usecases/update_category_use_case.dart';
import '../../features/admin/domain/usecases/update_sub_category_use_case.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  /// External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));

  /// DataSources
  sl.registerLazySingleton<CategoryDataSource>(
    () => CategoryDataSourceImpl(api: sl()),
  );
  sl.registerLazySingleton<ProductDataSource>(
    () => ProductDataSourceImp(api: sl()),
  );
  sl.registerLazySingleton<ReviewProductDataSource>(
    () => ReviewProductDataSourceImp(api: sl()),
  );
  //saller product data source
  sl.registerLazySingleton<SallerProductDataSource>(
    () => SallerProductDataSourceImpl(apiConsumer: sl()),
  );
  //store data source
  sl.registerLazySingleton<StoreDataSource>(
    () => StoreDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<UserDataSource>(
        () => UserDataSourceImpl(api: sl()),
  );
  /// Repositories
  sl.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImp(categoryDataSource: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () =>
        ProductRepositoryImpl(productDataSource: sl(), reviewDataSource: sl()),
  );
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl(apiConsumer: sl()));
  sl.registerLazySingleton<OrderRepo>(() => OrderRepoImpl(apiConsumer: sl()));
  //saller product repo
  sl.registerLazySingleton<SallerProductRepo>(
    () => SallerProductRepoImpl(sallerProductDataSource: sl()),
  );
  //store repo
    sl.registerLazySingleton<StoreRepo>(
    () => StoreRepoImpl(storeDataSource:  sl()),
  );
  sl.registerLazySingleton<UserRepo>(() => UserRepoImpl(sl<UserDataSource>()));

  /// UseCases
  sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
  sl.registerLazySingleton(() => SearchCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => GetSubCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetProductReviewUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => AddReviewUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => GetProductsByCategoryUseCase(sl()));
  sl.registerLazySingleton(() => AddCategoryUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCategoryUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => AddSubCategoryUseCase(sl()));
  sl.registerLazySingleton(() => UpdateSubCategoryUseCase(sl()));
  sl.registerLazySingleton(() => DeleteSubCategoryUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(sl<UserRepo>()));
  sl.registerLazySingleton(() => GetProductImagesUseCase(sl()));
    sl.registerLazySingleton(() => SearchSubCategoryUseCase());


    sl.registerLazySingleton(() => GetSallerProductUsecase(sallerProductRepo:  sl()));
//saller product usecase
  sl.registerLazySingleton(() => AddProductUseCase(sallerProductRepo: sl()));
    sl.registerLazySingleton(() => UploadProductImagesUseCase( sl()));
  //store usecase
    sl.registerLazySingleton(() => CreateStoreUseCase(sl()));
    sl.registerLazySingleton( () => GetStoreUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl<UserRepo>()));
  /// Cubits
  sl.registerFactory(
    () =>
        CategoryCubit(getCategoriesUseCase: sl(), searchCategoryUseCase: sl(), addCategoryUseCase: sl(), deleteCategoryUseCase: sl(), updateCategoryUseCase: sl()),
  );
  sl.registerFactory(() => ProductCubit(sl()));
  sl.registerFactory(() => SubCategoryCubit(getSubCategoryUseCase: sl(), addSubCategoryUseCase: sl(), deleteSubCategoryUseCase: sl(), updateSubCategoryUseCase: sl(), searchSubCategoryUseCase: sl()));
  sl.registerFactory(() => ReviewsCubit(sl(), sl()));
  sl.registerFactory(() => AddItemToCartCubit(sl()));
  sl.registerFactory(() => CartCubit(sl()));
  sl.registerFactory(() => ProductsByCategoryCubit(sl()));
  sl.registerFactory(() => ShippingCubit(sl()));
  sl.registerFactory(() => PaymentCubit(sl()));
  sl.registerFactory(() => PlaceOrderCubit(sl()));
  sl.registerFactory(() => TrackOrderDetailsCubit(sl()));
  sl.registerFactory(() => UserOrdersCubit(sl()));
    sl.registerFactory(() => GetProductImagesCubit(sl()));
  //saller product cubit
  sl.registerFactory(() => SellerProductCubit(addProductUseCase: sl(), getSallerProductUsecase: sl()));
//store cubit
  sl.registerFactory(() => StoreCubit(createStoreUseCase: sl(),getStoreUseCase: sl()));
  sl.registerFactory(()=>ProductImageCubit(sl()));
  // edit profile
  sl.registerFactory(() => EditProfileCubit(
    sl<UpdateUserUseCase>(),
    sl<GetUserUseCase>(),
  ));
}
