import '../../../domain.dart';

class GetTestHistoriesUseCase
    implements FutureUseCase<NoParams, List<TestHistoryModel>> {
  GetTestHistoriesUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  @override
  Future<List<TestHistoryModel>> execute(NoParams noParams) {
    return _testHistoryRepository.getAllTestHistories();
  }

}
