import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/common/base/base_exception.dart';
import 'package:flutter_starter/common/helpers/error_code.dart';
import 'package:flutter_starter/platform/networking/base/response.dart';

@injectable
class NetworkExceptionHandler {
  BaseException parse(dynamic err) {
    if (err is DioError) {
      return _dioErrorParser(err);
    } else if (err is BaseException) {
      return err;
    } else if (err is Result) {
      final code = int.parse(err.statusCode ?? "0");
      return BaseException(code: code, message: err.statusMsg);
    } else {
      return BaseException(
        code: NetworkErrorCode.unknown,
        message: "Something went wrong!",
      );
    }
  }

  BaseException _dioErrorParser(DioError err) {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      return BaseException(
          code: NetworkErrorCode.connectTimeout,
          message: 'Connection time out');
    } else if (err.type == DioErrorType.response) {
      return BaseException(
          code: err.response?.statusCode ?? NetworkErrorCode.unknown,
          message: err.response?.statusMessage);
    } else if (err.response?.data != null) {
      return BaseException(
          code: NetworkErrorCode.parseError, message: 'Parse error');
    }

    return BaseException(code: NetworkErrorCode.unknown);
  }
}
