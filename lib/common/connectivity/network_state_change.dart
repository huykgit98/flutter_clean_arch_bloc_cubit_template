import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/domain/use_cases/synchronize.dart';

@Singleton()
class NetworkStateChange {
  NetworkStateChange({required this.connectivity, required this.synchronize});

  final Connectivity connectivity;
  final Synchronize synchronize;

  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  void initNetworkChange() {
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_syncData);
  }

  Future<void> _syncData(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      // await synchronize.pullData(); // auto or manual trigger pull data?
      // resolve conflict
      // await synchronize.pushData();
      // await synchronize.pushData();
    }
  }

  void dispose() {
    if (_connectivitySubscription != null) {
      _connectivitySubscription?.cancel();
    }
  }
}
