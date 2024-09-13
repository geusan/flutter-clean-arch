import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/domain/user.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.api.g.dart';

@RestApi(baseUrl: "/v1")
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  @POST("/register")
  Future<User> register(
      @Field() String username, @Field() String password);

  @POST("/login")
  Future<User> login(
      @Field() String username, @Field() String password);
}
