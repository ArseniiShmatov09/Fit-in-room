import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'authentication_state.dart';

part 'authentication_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required SignInUseCase signInUseCase,
  })  : _signUpUseCase = signUpUseCase,
        _signInUseCase = signInUseCase,
        super(const AuthState()) {
    on<SignUpRequestedEvent>(_onSignUpRequested);
    on<SignInRequestedEvent>(_onSignInRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequestedEvent event, Emitter<AuthState> emit,) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _signUpUseCase.execute(event.user);
      emit(state.copyWith(status: AuthStatus.success, user: event.user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onSignInRequested(
      SignInRequestedEvent event, Emitter<AuthState> emit,) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _signInUseCase.execute(event.user);
      emit(state.copyWith(status: AuthStatus.success, user: event.user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

}
