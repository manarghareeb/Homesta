import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/dio_consumer.dart';
import 'package:homesta/features/categories/data/datasources/category_data_source.dart';
import 'package:homesta/features/categories/data/repositories/category_repo_imp.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';
import 'package:homesta/features/categories/domain/usecases/get_category_use_case.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  /// External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl()));
  /// DataSources
  sl.registerLazySingleton<CategoryDataSource>(
    () => CategoryDataSourceImpl( api: sl()),
  );

  /// Repositories
  sl.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImp(categoryDataSource: sl()),
  );

  /// UseCases
  sl.registerLazySingleton(
    () => GetCategoryUseCase(sl()),
  );

  /// Cubits
  sl.registerFactory(
    () => CategoryCubit(sl()),
  );
}
