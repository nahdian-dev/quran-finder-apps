import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkService {
  Future<bool> isConnected();
}

class NetworkServiceImpl extends NetworkService {
  @override
  Future<bool> isConnected() async {
    final Connectivity connectivity = Connectivity();

    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return Future.value(false);
    }

    return Future.value(true);
  }
}
