import '../entities/user.dart';

abstract class UserRepository {
  Future<User?> signIn(String userName, String password);
  Future<void> logout();
  Future<User?> getCurrentUser();
  Future<void> deleteCurrentUser();
}
