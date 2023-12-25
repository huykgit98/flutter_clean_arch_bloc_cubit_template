import 'package:flutter_starter/common/connectivity/network_state.dart';
import 'package:flutter_starter/domain/use_cases/synchronize.dart';
import 'package:flutter_starter/platform/database/database.dart';
import 'package:injectable/injectable.dart';

import '../storages/secure_storage_service.dart';

@Singleton(as: Synchronize)
class SynchronizeImpl implements Synchronize {
  final NetworkState networkState;
  final AppDatabase appDatabase;
  final SecureStorage secureStorage;

  SynchronizeImpl({
    required this.networkState,
    required this.appDatabase,
    required this.secureStorage,
  });

  @override
  Future<void> pullData() async {
    await _pullOfflineData();
    await pullMasterData();
  }

  @override
  Future<void> pullMasterData() async {
    try {} catch (_) {}
  }

  @override
  Future<void> pushData() async {}

  Future<bool> _pushDataOffline(SyncDataTable data, String action) async {
    switch (action) {
      default:
        // TODO: add more request here.

        return false;
    }
  }

  Future<void> _pullOfflineData() async {}

  Future<void> _deleteOfflineData() async {}
}
