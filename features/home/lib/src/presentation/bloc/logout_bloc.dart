import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'logout_state.dart';

part 'logout_event.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutBloc({
    required LogoutUseCase logoutUseCase,
  })  : _logoutUseCase = logoutUseCase,
        super(const LogoutState()) {
    on<LogoutRequestedEvent>(_onLogoutRequested);
  }

  Future<void> _onLogoutRequested(
    LogoutRequestedEvent event,
    Emitter<LogoutState> emit,
  ) async {
    try {
      await _logoutUseCase.execute(event.user);
      emit(
        state.copyWith(),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
