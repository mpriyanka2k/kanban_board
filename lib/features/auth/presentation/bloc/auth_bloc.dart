import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanbanboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/register_usecase.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final RegisterUsecase registerUsecase;

  AuthBloc(this.loginUsecase,this.logoutUsecase,this.registerUsecase) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await loginUsecase.login(event.email, event.password);
      print("Authenticated =$user");
      emit(Authenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(RegistrationLoading());
    try {
      final user = await registerUsecase.register(event.email, event.password);
      emit(RegistrationSuccessful(user!));
    } catch (e) {
      emit(RegistrationError(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    await logoutUsecase.logout();
    emit(Unauthenticated());
  }
}
