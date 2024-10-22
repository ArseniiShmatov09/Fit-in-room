import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'authentication_state.dart';

part 'authentication_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required SignInUseCase signInUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _signInUseCase = signInUseCase,
        _logoutUseCase = logoutUseCase,
        super(const AuthState()) {
    on<SignUpRequestedEvent>(_onSignUpRequested);
    on<SignInRequestedEvent>(_onSignInRequested);
    on<LogoutRequestedEvent>(_onLogoutRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequestedEvent event, Emitter<AuthState> emit,) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final String token = await _signUpUseCase.execute(event.user);
      emit(state.copyWith(status: AuthStatus.success, token: token));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onSignInRequested(
      SignInRequestedEvent event, Emitter<AuthState> emit,) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final String token = await _signInUseCase.execute(event.user);
      emit(state.copyWith(status: AuthStatus.success, token: token));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutRequestedEvent event, Emitter<AuthState> emit,) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _logoutUseCase.execute(event.user);
      emit(state.copyWith(status: AuthStatus.loggedOut));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }
}
