import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/domain/usecases/auth_usecase.dart';
import 'package:kanbanboard/features/auth/presentation/UI/screens/login_screen.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:kanbanboard/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase usecase;


  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();


  AuthBloc(this.usecase) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await usecase.login(event.email, event.password);
      print("Authenticated =$user");
      emit(Authenticated(user!));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
    emailCtrl.clear(); 
    passCtrl.clear();
  }

  Future<void> _onRegister(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(RegistrationLoading());
    try {
      final user = await usecase.register(event.email, event.password);
      emit(RegistrationSuccessful(user!));
    } catch (e) {
      emit(RegistrationError(e.toString()));
    }
    emailCtrl.clear(); 
    passCtrl.clear();
    confirmPassCtrl.clear();
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    await usecase.logout();
    event.context.go('/login');
    emit(Unauthenticated());
  }
}
