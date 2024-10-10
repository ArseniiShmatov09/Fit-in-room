import 'package:domain/domain.dart';

import '../../data.dart';

class TestHistoryRepositoryImpl implements TestHistoryRepository {
  final List<TestHistoryEntity> _allTestHistories =
      List<TestHistoryEntity>.generate(999, (int index) {
    return TestHistoryEntity(
      id: index + 1,
      itemLength: index + 4,
      itemWidth: index + 3,
      itemHeight: index + 2,
      roomId: index + 1,
      isTestPassed: index.isEven ? true : false,
    );
  });

  final TestHistoryMapper _testHistoryMapper = TestHistoryMapper();

  @override
  List<TestHistoryModel> getAllTestHistories() {
    return _allTestHistories.map(_testHistoryMapper.toDomain).toList();
  }
}
