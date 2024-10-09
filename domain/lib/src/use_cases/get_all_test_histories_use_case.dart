import '../../domain.dart';

class GetAllTestHistoriesUseCase
    implements UseCase<NoParams, List<TestHistoryModel>> {
  GetAllTestHistoriesUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  List<TestHistoryModel> call() {
    return _testHistoryRepository.getAllTestHistories();
  }

  @override
  List<TestHistoryModel> execute(NoParams noParams) {
    return _testHistoryRepository.getAllTestHistories();
  }
}
