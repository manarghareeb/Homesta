import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
        CacheHelper().getData(key: ApiKeys.token) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}'
            : null;
    super.onRequest(options, handler);
  }
}