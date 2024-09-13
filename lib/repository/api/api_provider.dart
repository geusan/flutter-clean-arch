import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch/repository/api/endpoints.dart';
import 'package:flutter_clean_arch/repository/api/interceptors/auth.interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider({BaseOptions? options}) {
    _dio = Dio(options ?? BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 60)
      ..receiveTimeout = const Duration(seconds: 60)
      ..headers.addAll({
        'Content-Type': 'application/json',
        'accept': 'application/json',
      }));
    FlutterSecureStorage storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
    _dio.interceptors.add(AuthInterceptor(storage: storage));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        // show log only debugMode
        enabled: kDebugMode,
    ));
  }

  get dio => _dio;
}
