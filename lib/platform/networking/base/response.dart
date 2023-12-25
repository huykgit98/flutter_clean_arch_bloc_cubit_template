import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(
    genericArgumentFactories: true,
    explicitToJson: true,
    fieldRename: FieldRename.none)
abstract class Response<T> {
  Response({
    this.result,
  });

  final T? result;
}

@JsonSerializable(
    genericArgumentFactories: true,
    explicitToJson: true,
    fieldRename: FieldRename.none)
abstract class Result<T> {
  Result({
    this.action,
    this.statusCode,
    this.statusMsg,
    this.count,
    this.data,
  });

  final String? action;
  final String? statusCode;
  final String? statusMsg;
  final int? count;
  @JsonKey()
  final T? data;
}
