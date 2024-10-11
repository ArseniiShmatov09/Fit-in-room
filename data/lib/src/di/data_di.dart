import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
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

    locator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        locator<DioConfig>().dio,
      ),
    );
  }

  static void _initProviders(GetIt locator) {}

  static void _initRepositories(GetIt locator) {
    locator.registerLazySingleton<AllRoomsRepository>(
      AllRoomsRepositoryImpl.new,
    );

    locator.registerLazySingleton<RoomRepository>(
      RoomRepositoryImpl.new,
    );

    locator.registerLazySingleton<TestHistoryRepository>(
      TestHistoryRepositoryImpl.new,
    );
  }
}
