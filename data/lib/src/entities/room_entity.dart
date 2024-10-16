import 'package:json_annotation/json_annotation.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class RoomEntity {
  final String id;
  final String name;
  final int length;
  final int width;
  final int height;
  final int userId;

  RoomEntity({
    required this.id,
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.userId,
  });

  factory RoomEntity.fromJson(Map<String, dynamic> json) => _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);

}
