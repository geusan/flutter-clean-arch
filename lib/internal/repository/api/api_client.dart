import 'package:dio/dio.dart';
import 'dart:io' show Platform;

String _getOs() {
  if (Platform.isAndroid) {
    return 'android';
  } else if (Platform.isIOS) {
    return 'ios';
  } else if (Platform.isMacOS) {
    return 'macos';
  } else if (Platform.isWindows) {
    return 'window';
  }
  return 'etc';
}

class ApiClient {
  Dio dio;
  ApiClient(this.dio) {
    dio.options.baseUrl = 'http://localhost:8000/';
    dio.options.headers['Platform-Os'] = _getOs();
    dio.options.headers['Platform-Os-Version'] = Platform.version;
    dio.options.headers['App-Version'];
  }
}
