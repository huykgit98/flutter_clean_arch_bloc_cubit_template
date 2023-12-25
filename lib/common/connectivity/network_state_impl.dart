import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_starter/common/connectivity/network_state.dart';


@Singleton(as: NetworkState)
class NetworkStateImpl implements NetworkState {
  NetworkStateImpl({required this.connectivity});

  final Connectivity connectivity;

  @override
  Future<bool> isConnected() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }

    return false;
  }
}
