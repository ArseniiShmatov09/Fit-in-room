import 'package:core/core.dart';
import '../../domain.dart';

abstract class DomainDI {
  static void initDependencies(GetIt locator) {
    _initUseCases(locator);
  }

  static void _initUseCases(GetIt locator) {
    locator.registerLazySingleton<GetAllRoomsUseCase>(
      () => GetAllRoomsUseCase(
        allRoomsRepository: locator<AllRoomsRepository>(),
      ),
    );

    locator.registerLazySingleton<GetRoomUseCase>(
      () => GetRoomUseCase(
        roomRepository: locator<RoomRepository>(),
      ),
    );

    locator.registerLazySingleton<AddRoomUseCase>(
      () => AddRoomUseCase(
        roomRepository: locator<RoomRepository>(),
      ),
    );

    locator.registerLazySingleton<DeleteRoomUseCase>(
      () => DeleteRoomUseCase(
        roomRepository: locator<RoomRepository>(),
      ),
    );

    locator.registerLazySingleton<UpdateRoomUseCase>(
      () => UpdateRoomUseCase(
        roomRepository: locator<RoomRepository>(),
      ),
    );

    locator.registerLazySingleton<GetTestHistoriesUseCase>(
      () => GetTestHistoriesUseCase(
        testHistoryRepository: locator<TestHistoryRepository>(),
      ),
    );

    locator.registerLazySingleton<AddTestHistoryUseCase>(
      () => AddTestHistoryUseCase(
        testHistoryRepository: locator<TestHistoryRepository>(),
      ),
    );

    locator.registerLazySingleton<TestRoomFitUseCase>(
      () => TestRoomFitUseCase(
        testRoomFitRepository: locator<TestRoomFitRepository>(),
      ),
    );

    locator.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(
        authenticationRepository: locator<AuthenticationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        authenticationRepository: locator<AuthenticationRepository>(),
      ),
    );

    locator.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(
        authenticationRepository: locator<AuthenticationRepository>(),
      ),
    );
  }
}
