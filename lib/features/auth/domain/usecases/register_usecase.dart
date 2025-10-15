

import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final IAuthRepository repository;

  RegisterUsecase(this.repository);

  Future<AppUser?> register(String email, String password) {
    return repository.register(email, password);
  }

}
