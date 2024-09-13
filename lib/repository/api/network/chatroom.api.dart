import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

part 'chatroom.api.g.dart';

@RestApi(baseUrl: '/v1/rooms')
abstract class ChatroomApi {
  factory ChatroomApi(Dio dio, { String? baseUrl }) = _ChatroomApi;

  @GET('')
  @http.Headers({"accessToken": "true"})
  Future<List<Chatroom>> getChatrooms();

  @POST('')
  @http.Headers({"accessToken": "true"})
  Future<Chatroom> createChatroom(@Field() String name);

  @DELETE('/{id}')
  @http.Headers({"accessToken": "true"})
  Future<void> deleteChatroom(@Path() int id);

  @GET('/{id}/open')
  @http.Headers({"accessToken": "true"})
  Future<ResponseOpenChatroomDto> openChatroom(@Path() int id);
}


@JsonSerializable()
class ResponseOpenChatroomDto {
  String url;
  ResponseOpenChatroomDto({required this.url});

  factory ResponseOpenChatroomDto.fromJson(Map<String, dynamic> json) => _$ResponseOpenChatroomDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseOpenChatroomDtoToJson(this);
}
