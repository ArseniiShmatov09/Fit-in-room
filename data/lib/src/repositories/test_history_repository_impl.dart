import 'package:domain/domain.dart';

class TestHistoryRepositoryImpl implements TestHistoryRepository {
  final List<TestHistoryModel> _allTestHistories = <TestHistoryModel>[];

  @override
  List<TestHistoryModel> getAllTestHistories() {
    return _allTestHistories;
  }
}
