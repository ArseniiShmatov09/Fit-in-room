import '../../../domain.dart';

class GetTestHistoriesUseCase
    implements FutureUseCase<String, List<TestHistoryModel>> {
  GetTestHistoriesUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  @override
  Future<List<TestHistoryModel>> execute(String username) {
    return _testHistoryRepository.getAllTestHistories(username);
  }

}
