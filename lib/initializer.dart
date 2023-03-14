import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Initializer {
  static Future init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
      _initGetConnect();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    connect.baseUrl = 'https://private-16555-erd.apiary-mock.com/';
    Logger().d(connect.baseUrl);
    Get.put(connect);
  }
}
