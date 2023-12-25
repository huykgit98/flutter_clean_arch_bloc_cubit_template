import 'package:flutter_starter/domain/entities/user.dart';
import 'package:flutter_starter/domain/repositories/user_repository.dart';
import 'package:flutter_starter/domain/use_cases/authentication_usecases.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationUseCases)
class AuthenticationUseCasesImpl implements AuthenticationUseCases {
  final UserRepository userRepository;

  AuthenticationUseCasesImpl({required this.userRepository});

  @override
  Future<User?> getCurrentUser() {
    return userRepository.getCurrentUser();
  }

  @override
  Future<void> logout() {
    return userRepository.logout();
  }

  @override
  Future<User?> signIn(String userName, String password) {
    return userRepository.signIn(userName, password);
  }
}
