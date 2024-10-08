import 'package:domain/domain.dart';

class TestHistoryRepositoryImpl implements TestHistoryRepository {
  final List<TestHistoryModel> _allTestHistories = <TestHistoryModel>[];

  @override
  Future<List<TestHistoryModel>> getAllTestHistories() async {
    return _allTestHistories;
  }
}
