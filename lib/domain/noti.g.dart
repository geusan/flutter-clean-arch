// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Noti _$NotiFromJson(Map<String, dynamic> json) => Noti(
      id: (json['id'] as num?)?.toInt(),
      content: json['content'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$NotiToJson(Noti instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'timestamp': instance.timestamp,
    };
