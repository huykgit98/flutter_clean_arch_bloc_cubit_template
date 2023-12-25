// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parameter _$ParameterFromJson(Map<String, dynamic> json) => Parameter(
      action: json['action'] as String,
      platform: json['platform'] as String,
      platformVersion: json['platformVersion'] as String,
      appVersion: json['appVersion'] as String,
      data: json['data'] as String?,
      apiToken: json['apiToken'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
      'action': instance.action,
      'platform': instance.platform,
      'platformVersion': instance.platformVersion,
      'appVersion': instance.appVersion,
      'data': instance.data,
      'apiToken': instance.apiToken,
      'userId': instance.userId,
    };
