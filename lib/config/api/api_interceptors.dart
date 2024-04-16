// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['token'] = sl<CacheHelper>().getData(key: 'token') != null
    //     ? 'FOODAPI ${sl<CacheHelper>().getData(key: 'token')}'
    //     : null;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
 
    super.onError(err, handler);
  }
}
