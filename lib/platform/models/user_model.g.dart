// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      apiToken: json['apiToken'] as String?,
      roleId: json['roleId'] as int?,
      name: json['name'] as String?,
      rolevalue: json['rolevalue'] as String?,
      userId: json['userId'] as int?,
      encodeToken: json['encodeToken'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'apiToken': instance.apiToken,
      'userId': instance.userId,
      'name': instance.name,
      'roleId': instance.roleId,
      'rolevalue': instance.rolevalue,
      'encodeToken': instance.encodeToken,
    };
