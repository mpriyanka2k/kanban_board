

import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';

class AuthUsecase {
  final IAuthRepository repository;

  AuthUsecase(this.repository);

  Future<AppUser?> login(String email, String password) {
    return repository.login(email, password);
  }

  Future<AppUser?> register(String email, String password) {
    return repository.register(email, password);
  }

  Future<void> logout() {
    return repository.logout();
  }
}
