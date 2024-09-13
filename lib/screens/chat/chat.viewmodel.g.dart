// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.viewmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) => ChatItem(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ChatItemToJson(ChatItem instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
