import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectionRepos {
  late bool networkOn;
  final Connectivity _connectivity = Connectivity();
  Future<bool> checkConnection() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    log('CONNECTION STATE', error: '$result');

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        networkOn = true;
        break;
      case ConnectivityResult.none:
        networkOn = false;
        break;
      default:
        networkOn = false;
        break;
    }
    return networkOn;
  }
}
