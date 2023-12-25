import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer' as v;
import 'package:flutter/foundation.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      v.log(_logCurl(options));
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      var encoder = const JsonEncoder.withIndent("     ");
      var json = encoder.convert(response.data);
      print('<=== [API] onResponse ===>\n$json');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('[API] onError =>\n${err.toString()}');
    }
    handler.reject(err);
  }

  String _logCurl(RequestOptions requestOption) {
    var curl = '';
    // Add PATH + REQUEST_METHOD
    curl +=
        // ignore: lines_longer_than_80_chars
        'curl --request ${requestOption.method} \'${requestOption.uri}\'\n';

    // Include headers
    for (final key in requestOption.headers.keys) {
      curl += ' -H \'$key: ${requestOption.headers[key]}\'\n';
    }
    // Include data if there is data
    if (requestOption.data != null && requestOption.data is! FormData) {
      if (requestOption.data is Map && (requestOption.data as Map).isEmpty) {
      } else {
        curl += ' --data-binary \n\'${json.encode(requestOption.data)}\'\n';
      }
    }
    curl += ' --insecure'; //bypass https verification
    return curl;
  }
}
