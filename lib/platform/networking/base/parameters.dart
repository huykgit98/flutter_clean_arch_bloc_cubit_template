import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_starter/platform/models/current_user.dart';

part 'parameters.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class Parameter {
  final String action;
  final String platform;
  final String platformVersion;
  final String appVersion;
  final String? data;
  final String? apiToken;
  final int? userId;

  Parameter({
    required this.action,
    required this.platform,
    required this.platformVersion,
    required this.appVersion,
    this.data,
    this.apiToken,
    this.userId,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterToJson(this);

  factory Parameter.build({required String action, String? data}) =>
      Parameter(
          action: action,
          platform: Platform.operatingSystemVersion.substring(0, 9),
          platformVersion: Platform.operatingSystem,
          appVersion: '1.0.0',
          userId: CurrentUser.instance.userId,
          apiToken: CurrentUser.instance.apiToken,
          data: data);
}
