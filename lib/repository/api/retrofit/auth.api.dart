import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  @POST("/register")
  Future<ResponseAuthDto> register(
      @Field() String username, @Field() String password);

  @POST("/login")
  Future<ResponseAuthDto> login(
      @Field() String username, @Field() String password);
}

@JsonSerializable()
class ResponseAuthDto {
  int id;
  String name;
  String? token;

  ResponseAuthDto({required this.id, required this.name, this.token});

  factory ResponseAuthDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseAuthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseAuthDtoToJson(this);
}
