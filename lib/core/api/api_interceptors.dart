import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] =
        CacheHelper().getData(key: ApiKeys.token) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}'
            : null;
    // options.headers['Authorization'] =
    // 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}';
    // options.followRedirects = false;
    // options.validateStatus = (status) => status != null && status < 500;

    super.onRequest(options, handler);
  }
}
