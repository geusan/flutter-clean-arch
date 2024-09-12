import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/domain/chatroom.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'chatroom.api.g.dart';

@RestApi(baseUrl: '/rooms')
abstract class ChatroomApi {
  factory ChatroomApi(Dio dio, { String? baseUrl }) = _ChatroomApi;

  @GET('')
  Future<List<Chatroom>> getChatrooms();

  @POST('')
  Future<Chatroom> createChatroom(@Field('name') String name);

  @DELETE('/{id}')
  Future<void> deleteChatroom(@Path() int id);

  @GET('/{id}/open')
  Future<void> openChatroom(@Path() int id);
}


@JsonSerializable()
class ResponseOpenChatroomDto {
  String url;
  ResponseOpenChatroomDto({required this.url});

  factory ResponseOpenChatroomDto.fromJson(Map<String, dynamic> json) => _$ResponseOpenChatroomDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseOpenChatroomDtoToJson(this);
}
