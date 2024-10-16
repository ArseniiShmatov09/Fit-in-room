import '../../domain.dart';

abstract class TestHistoryRepository {
  Future<List<TestHistoryModel>> getAllTestHistories();
  Future<void> addTestHistory(TestHistoryModel testHistoryModel);
}
