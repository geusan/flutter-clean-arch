import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/common/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthInterceptor extends Interceptor {
  FlutterSecureStorage storage;
  AuthInterceptor({required this.storage});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // If retrofit usecase with below
    // @Headers({"withAccessToken": "any value"})
    if (options.headers[StorageKeys.withAccessToken.value] != null) {
      options.headers.remove(StorageKeys.withAccessToken.value);

      String? token = await storage.read(key: StorageKeys.accessToken.value);

      options.headers.addAll({
        "Authorization": "Bearer $token"
      });
      
    }
    super.onRequest(options, handler);
  }
}
