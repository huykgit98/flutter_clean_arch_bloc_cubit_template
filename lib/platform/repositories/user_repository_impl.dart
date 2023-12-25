import 'dart:convert';

import 'package:flutter_starter/common/helpers/exception_handler.dart';
import 'package:flutter_starter/config/constants/app_constants.dart';
import 'package:flutter_starter/domain/entities/user.dart';
import 'package:flutter_starter/domain/repositories/user_repository.dart';
import 'package:flutter_starter/platform/models/user_model.dart';
import 'package:flutter_starter/platform/networking/network_provider_property_api.dart';
import 'package:flutter_starter/platform/storages/secure_storage_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final SecureStorage secureStorage;
  final NetworkExceptionHandler exceptionHandler;
  final NetworkProviderPropertyApi networkProviderPropertyApi;

  UserRepositoryImpl(
      {required this.secureStorage, required this.exceptionHandler, required this.networkProviderPropertyApi});

  @override
  Future<User?> signIn(String userName, String password) async {
    // final loginCredentials =
    //     LoginCredentials(userName: userName, passWord: password);
    // try {
    //   final response = await networkProviderPropertyApi.signIn(parameter: loginCredentials);
    //   if (response != null) {
    //     response.encodeToken = base64.encode(utf8.encode(response.apiToken ?? ''));
    //     await secureStorage.write(Constants.userCredential, jsonEncode(response));
    //   }
    //   return response;
    // } catch (error) {
    //   return Future.error(exceptionHandler.parse(error));
    // }
    return null;
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userStr = await secureStorage.read(Constants.userCredential);
      if (userStr != null) {
        var json = jsonDecode(userStr);
        return UserModel.fromJson(json);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteCurrentUser() async {
    await secureStorage.delete(Constants.userCredential);
    await secureStorage.delete(Constants.userPermissions);
  }

  @override
  Future<void> logout() async {
    try {
      await deleteCurrentUser();
    } catch (error) {
      return Future.error(exceptionHandler.parse(error));
    }
  }
}
