import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data.dart';
import '../mappers/user_mapper.dart';
import '../providers/authentication_provider.dart';
import '../providers/authentication_provider_impl.dart';
import '../providers/firebase_provider.dart';
import '../repositories/authentication_repository_impl.dart';
import '../repositories/settings_repository_impl.dart';
import '../repositories/test_room_fit_repository_impl.dart';

abstract class DataDI {
  static void initDependencies(GetIt locator) {
    _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
    _initMappers(locator);
    _initSharedPreferences(locator);
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

  static Future<void> _initSharedPreferences(GetIt locator) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  static void _initMappers(GetIt locator) {
    locator.registerLazySingleton<RoomMapper>(
      RoomMapper.new,
    );

    locator.registerLazySingleton<TestHistoryMapper>(
      TestHistoryMapper.new,
    );

    locator.registerLazySingleton<UserMapper>(
      UserMapper.new,
    );
  }

  static void _initProviders(GetIt locator) {
    locator.registerLazySingleton<AuthenticationProvider>(
      () => AuthenticationProviderImpl(
        dio: Dio(),
      ),
    );
  }

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

    locator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        preferences: locator<SharedPreferences>(),
      ),
    );

    locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        apiProvider: locator<AuthenticationProvider>(),
        userMapper: locator<UserMapper>(),
      ),
    );
  }
}
