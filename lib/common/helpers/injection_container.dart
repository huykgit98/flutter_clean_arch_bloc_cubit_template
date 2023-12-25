import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/common/helpers/network_interceptor.dart';
import 'package:flutter_starter/common/helpers/token_interceptor.dart';
import 'package:flutter_starter/platform/networking/network_provider_property_api.dart';

import 'injection_container.config.dart';

final di = GetIt.asNewInstance();

@InjectableInit()
Future<void> init() async {
  var baseUrl = dotenv.env['BASE_URL'] ?? '';
  dio.BaseOptions options = dio.BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 90000, //90s
      receiveTimeout: 90000, //90s
      headers: {
        "platform": Platform.operatingSystemVersion.substring(0, 9),
        "platformVersion": Platform.operatingSystem,
        "appVersion": '1.0.0'
      },
      contentType: dio.Headers.jsonContentType);
  var dtoDio = dio.Dio(options);
  dtoDio.interceptors.add(TokenInterceptor());
  dtoDio.interceptors.add(NetworkInterceptor());

  // property api
  var propertyBaseUrl = dotenv.env['PROPERTY_API_BASE_URL'] ?? '';
  await di.reset();

  di.registerLazySingleton(() => NetworkProviderPropertyApi(dtoDio, baseUrl: propertyBaseUrl));
  di.registerLazySingleton(() => Connectivity());
  $initGetIt(di);
}
