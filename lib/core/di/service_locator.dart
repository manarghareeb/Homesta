import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/dio_consumer.dart';
import 'package:homesta/features/cart/data/repos/cart_repo_impl.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/categories/data/datasources/category_data_source.dart';
import 'package:homesta/features/categories/data/repositories/category_repo_imp.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';
import 'package:homesta/features/categories/domain/usecases/get_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/get_sub_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/search_category_use_case.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/product_data_source.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/review_data_source.dart';
import 'package:homesta/features/product/data/repositories/product_repository_impl.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';
import 'package:homesta/features/product/domain/usecases/add_review_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_all_product_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_product_review_use_case.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/seller/product/data/data_source/saller_product_data_source.dart';
import 'package:homesta/features/seller/product/data/repo/saller_repo_impl.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';
import 'package:homesta/features/seller/product/domain/usecases/add_product_use_case.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_cubit.dart';

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

  /// Repositories
  sl.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImp(categoryDataSource: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () =>
        ProductRepositoryImpl(productDataSource: sl(), reviewDataSource: sl()),
  );
  sl.registerLazySingleton<CartRepo>(() => CartRepoImpl(apiConsumer: sl()));
  //saller product repo
  sl.registerLazySingleton<SallerProductRepo>(
    () => SallerProductRepoImpl(sallerProductDataSource: sl()),
  );

  /// UseCases
  sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
  sl.registerLazySingleton(() => SearchCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductUseCase(productRepository: sl()));
  sl.registerLazySingleton(() => GetSubCategoryUseCase(sl()));
  sl.registerLazySingleton(
    () => GetProductReviewUseCase(productRepository: sl()),
  );
  sl.registerLazySingleton(() => AddReviewUseCase(productRepository: sl()));
//saller product usecase
  sl.registerLazySingleton(() => AddProductUseCase(sallerProductRepo: sl()));
  /// Cubits
  sl.registerFactory(
    () =>
        CategoryCubit(getCategoriesUseCase: sl(), searchCategoryUseCase: sl()),
  );
  sl.registerFactory(() => ProductCubit(sl()));
  sl.registerFactory(() => SubCategoryCubit(getSubCategoryUseCase: sl()));
  sl.registerFactory(() => ReviewsCubit(sl(), sl()));
  sl.registerFactory(() => AddItemToCartCubit(sl()));
  //saller product cubit
  sl.registerFactory(() => SellerProductCubit(addProductUseCase: sl()));
}
