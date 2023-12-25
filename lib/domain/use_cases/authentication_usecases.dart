import 'package:flutter_starter/domain/entities/user.dart';

abstract class AuthenticationUseCases {
  Future<User?> signIn(String userName, String password);
  Future<User?> getCurrentUser();
  Future<void> logout();
}
