import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/common/storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class AuthInterceptor extends Interceptor {
  FlutterSecureStorage storage;
  AuthInterceptor({required this.storage});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // If retrofit usecase with below
    // @Headers({"accessToken": "true"})
    if (options.headers["accessToken"] == "true") {
      options.headers.remove("accessToken");

      String? token = await storage.read(key: StorageKeys.accessToken.value);

      options.headers.addAll({
        "Authorization": "Bearer $token"
      });
      
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final token = response.headers['set-authorization'];
    if (token != null && token.isNotEmpty) {
      storage.write(key: StorageKeys.accessToken.value, value: token[0]);
    }
    super.onResponse(response, handler);
  }
}
