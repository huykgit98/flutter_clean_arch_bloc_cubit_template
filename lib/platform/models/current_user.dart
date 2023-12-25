import 'package:flutter_starter/domain/entities/user.dart';
import 'package:flutter_starter/platform/models/user_model.dart';

class CurrentUser extends UserModel {
  CurrentUser._();
  static final CurrentUser _instance = CurrentUser._();
  static CurrentUser get instance => _instance;

  factory CurrentUser(User? object) {
    _instance.name = object?.name;
    _instance.apiToken = object?.apiToken;
    _instance.roleId = object?.roleId;
    _instance.rolevalue = object?.rolevalue;
    _instance.userId = object?.userId;
    _instance.encodeToken = object?.encodeToken;
    return _instance;
  }
}
