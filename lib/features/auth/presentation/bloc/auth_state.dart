import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final AppUser user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class RegistrationLoading extends AuthState{

}

class RegistrationSuccessful extends AuthState {
  final AppUser user;
  RegistrationSuccessful(this.user);
}

class RegistrationError extends AuthState {
  final String message;
  RegistrationError(this.message);
}


