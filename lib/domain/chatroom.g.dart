// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chatroom _$ChatroomFromJson(Map<String, dynamic> json) => Chatroom(
      chatroomId: (json['chatroomId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ChatroomToJson(Chatroom instance) => <String, dynamic>{
      'chatroomId': instance.chatroomId,
      'name': instance.name,
    };
