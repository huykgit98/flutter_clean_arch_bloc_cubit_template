import 'package:flutter_starter/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true, createToJson: true)
class UserModel extends User {
  UserModel({
    super.apiToken,
    super.roleId,
    super.name,
    super.rolevalue,
    super.userId,
    super.encodeToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
