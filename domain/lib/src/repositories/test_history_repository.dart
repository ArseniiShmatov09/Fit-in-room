import '../../domain.dart';

abstract class TestHistoryRepository {
  Future<List<TestHistoryModel>> getAllTestHistories(String username);
  Future<void> addTestHistory(TestHistoryModel testHistoryModel);
}
