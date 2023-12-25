import 'dart:async';

import 'package:flutter/material.dart';

import '../../config/constants/app_constants.dart';
import '../../platform/storages/secure_storage_service.dart';
import '../connectivity/network_state.dart';

class AppHelper {
  AppHelper._();

  static isConnected(NetworkState networkState) async {
    return await networkState.isConnected();
  }

  static isOnline(SecureStorage secureStorage) async {
    return await secureStorage.readBool(Constants.dataMode) ?? true;
  }
}

class DebounceHelper {
  Timer? _debounce;
  debounce(int milliseconds, VoidCallback function) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(Duration(milliseconds: milliseconds), function);
  }

  void dispose() {
    _debounce?.cancel();
  }
}
