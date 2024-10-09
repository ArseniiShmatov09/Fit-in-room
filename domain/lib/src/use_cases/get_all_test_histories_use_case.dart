import '../../domain.dart';

class GetAllTestHistoriesUseCase
    implements FutureUseCase<NoParams, List<TestHistoryModel>> {
  GetAllTestHistoriesUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  List<TestHistoryModel> call() {
    return _testHistoryRepository.getAllTestHistories();
  }

  @override
  Future<List<TestHistoryModel>> execute(NoParams noParams) async {
    return _testHistoryRepository.getAllTestHistories();
  }
}
