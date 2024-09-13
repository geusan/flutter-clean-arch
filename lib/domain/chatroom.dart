import 'package:json_annotation/json_annotation.dart';

part 'chatroom.g.dart';

@JsonSerializable()
class Chatroom {
  int id;
  String name;
  Chatroom({required this.id, required this.name});
  factory Chatroom.fromJson(Map<String, dynamic> json) => _$ChatroomFromJson(json);
  Map<String, dynamic> toJson() => _$ChatroomToJson(this);
}
