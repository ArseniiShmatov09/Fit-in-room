import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';
import '../repositories/test_room_fit_repository_impl.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
    _initMappers(locator);
  }

  static void _initApi(GetIt locator) {
    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );

    locator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: locator<AppEventNotifier>(),
      ),
    );

    locator.registerLazySingleton<FirebaseProviderImpl>(
      FirebaseProviderImpl.new,
    );
  }

  static void _initMappers(GetIt locator) {
    locator.registerLazySingleton<RoomMapper>(
      RoomMapper.new,
    );

    locator.registerLazySingleton<TestHistoryMapper>(
      TestHistoryMapper.new,
    );
  }

  static void _initProviders(GetIt locator) {}

  static void _initRepositories(GetIt locator) {
    locator.registerLazySingleton<AllRoomsRepository>(
      () => AllRoomsRepositoryImpl(
        apiProvider: locator<FirebaseProviderImpl>(),
        roomMapper: locator<RoomMapper>(),
      ),
    );

    locator.registerLazySingleton<RoomRepository>(
      () => RoomRepositoryImpl(
        apiProvider: locator<FirebaseProviderImpl>(),
        roomMapper: locator<RoomMapper>(),
      ),
    );

    locator.registerLazySingleton<TestHistoryRepository>(
      () => TestHistoryRepositoryImpl(
        apiProvider: locator<FirebaseProviderImpl>(),
        testHistoryMapper: locator<TestHistoryMapper>(),
      ),
    );

    locator.registerLazySingleton<TestRoomFitRepository>(
        TestRoomFitRepositoryImpl.new,
    );
  }
}
