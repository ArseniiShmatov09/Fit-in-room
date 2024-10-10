class TestHistoryEntity {
  final int id;
  final int itemLength;
  final int itemWidth;
  final int itemHeight;
  final int roomId;
  final bool isTestPassed;

  TestHistoryEntity({
    required this.id,
    required this.itemLength,
    required this.itemWidth,
    required this.itemHeight,
    required this.roomId,
    required this.isTestPassed,
  });
}
