import 'package:domain/domain.dart';
import '../../data.dart';

class TestHistoryRepositoryImpl implements TestHistoryRepository {
  TestHistoryRepositoryImpl({
    required FirebaseProviderImpl apiProvider,
    required TestHistoryMapper testHistoryMapper,
  })  : _apiProvider = apiProvider,
        _testHistoryMapper = testHistoryMapper;

  final FirebaseProviderImpl _apiProvider;
  final TestHistoryMapper _testHistoryMapper;

  @override
  Future<List<TestHistoryModel>> getAllTestHistories() async {
    final List<Map<String, dynamic>> testHistoryData =
        await _apiProvider.getAllTestHistories();
    final List<TestHistoryEntity> testHistoryEntities =
        testHistoryData.map(TestHistoryEntity.fromJson).toList();
    return testHistoryEntities.map(_testHistoryMapper.toDomain).toList();
  }

  @override
  Future<void> addTestHistory(TestHistoryModel testHistoryModel) {
   return _apiProvider
        .addTestHistory(_testHistoryMapper.toData(testHistoryModel).toJson());
  }
}
