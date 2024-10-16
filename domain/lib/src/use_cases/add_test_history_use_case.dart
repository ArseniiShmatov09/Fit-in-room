import '../../domain.dart';

class AddTestHistoryUseCase implements FutureUseCase<TestHistoryModel, void> {
  AddTestHistoryUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  @override
  Future<void> execute(TestHistoryModel testHistoryModel) async {
    _testHistoryRepository.addTestHistory(testHistoryModel);
  }
}
