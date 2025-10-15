import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email, password;
  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String email, password;
  RegisterRequested(this.email, this.password);
}

class LogoutRequested extends AuthEvent {
  final BuildContext context;
  LogoutRequested(this.context);
}
