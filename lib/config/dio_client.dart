import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/di.dart';
import 'package:flutter_clean_arch/internal/repository/shared_preference/local_storage.dart';

class DioClient {
  final LocalStorage _localStorage = inject<LocalStorage>();
  late Dio _client;

  DioClient() {
    _client = Dio();
    _client.interceptors.add(_interceptor());
  }

  Interceptor _interceptor() {
    return InterceptorsWrapper(
      onRequest:
          (RequestOptions request, RequestInterceptorHandler handler) async {
        String? storageToken = await _localStorage.get(StorageKey.token);
        if (storageToken != null) {
          request.headers.addAll({
            "Authorization": 'Bearer $storageToken',
          });
        }
      },
    );
  }

  Future<Response> get(String url) => _client.get(url);
  Future<Response> post(String url, {dynamic body, dynamic headers}) =>
      _client.post(url, data: body);
  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);
  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}
