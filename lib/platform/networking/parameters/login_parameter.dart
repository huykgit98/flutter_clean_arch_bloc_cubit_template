import 'package:json_annotation/json_annotation.dart';

part 'login_parameter.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, createFactory: false)
class LoginCredentials {
  final String userName;
  final String passWord;

  LoginCredentials({required this.userName, required this.passWord});
  Map<String, dynamic> toJson() => _$LoginCredentialsToJson(this);
}
