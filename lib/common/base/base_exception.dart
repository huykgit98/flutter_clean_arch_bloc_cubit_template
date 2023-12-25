import 'package:flutter_starter/common/helpers/error_code.dart';

class BaseException implements Exception {
  final int code;
  final String? message;
  BaseException({this.code = NetworkErrorCode.unknown, this.message});
}
