class TestHistoryModel {
  final String id;
  final int itemLength;
  final int itemWidth;
  final int itemHeight;
  final String roomName;
  final bool isTestPassed;

  TestHistoryModel({
    required this.id,
    required this.itemLength,
    required this.itemWidth,
    required this.itemHeight,
    required this.roomName,
    required this.isTestPassed,
  });

  List<Object?> get props => <Object?>[
        id,
        itemLength,
        itemWidth,
        itemHeight,
        roomName,
        isTestPassed,
      ];
}
