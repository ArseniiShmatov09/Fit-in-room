import '../../domain.dart';

class GetAllTestHistoriesUseCase {
  GetAllTestHistoriesUseCase({
    required TestHistoryRepository testHistoryRepository,
  }) : _testHistoryRepository = testHistoryRepository;

  final TestHistoryRepository _testHistoryRepository;

  Future<List<TestHistoryModel>> call() async {
    final List<TestHistoryModel> list =
        await _testHistoryRepository.getAllTestHistories();
    return list;
  }
}
