import 'package:json_annotation/json_annotation.dart';

part 'noti.g.dart';

@JsonSerializable()
class Noti {
  int? id;
  String content;
  int timestamp;
  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(timestamp);

  Noti({required this.id, required this.content, required this.timestamp});

  factory Noti.fromJson(Map<String, dynamic> json) => _$NotiFromJson(json);
  Map<String, dynamic> toJson() => _$NotiToJson(this);
}
