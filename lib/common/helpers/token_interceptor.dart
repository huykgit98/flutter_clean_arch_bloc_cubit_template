import 'package:dio/dio.dart';
import 'package:flutter_starter/platform/models/current_user.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Authorization"] = "Bearer ${CurrentUser.instance.encodeToken}";
    super.onRequest(options, handler);
  }
}

