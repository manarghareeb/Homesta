import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.authorization] =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjRjYTc4ZmZkLWVjNGEtNDI3Zi1hZjZjLWY2NmQ5NGM1YjQxMCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1vaGFtbWVkcmFkeTEyMzBAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU2VsbGVyIiwiZXhwIjoxNzY3NzQ3NzQ4LCJpc3MiOiJIb21lRmluaXNoQVBJIiwiYXVkIjoiSG9tZUZpbmlzaENsaWVudCJ9.M9RJbnKjoPXIlwRJNzrq1rTewPYYNwNY3P-H0EWwMfU";
    // CacheHelper().getData(key: ApiKeys.token) != null
    //     ? 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}'
    //     : null;
    options.headers["Content-Type"] = "application/json";

    options.headers["Accept"] = "application/json";

    super.onRequest(options, handler);
  }
}
