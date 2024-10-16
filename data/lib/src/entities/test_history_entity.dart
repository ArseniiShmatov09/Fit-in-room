import 'package:json_annotation/json_annotation.dart';

part 'test_history_entity.g.dart';

@JsonSerializable()
class TestHistoryEntity {
  final String id;
  final int itemLength;
  final int itemWidth;
  final int itemHeight;
  final String roomName;
  final bool isTestPassed;

  TestHistoryEntity({
    required this.id,
    required this.itemLength,
    required this.itemWidth,
    required this.itemHeight,
    required this.roomName,
    required this.isTestPassed,
  });

  factory TestHistoryEntity.fromJson(Map<String, dynamic> json) => _$TestHistoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TestHistoryEntityToJson(this);
}
