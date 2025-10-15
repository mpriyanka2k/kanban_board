import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase {
  final IAuthRepository repository;

  LoginUsecase(this.repository);

  Future<AppUser?> login(String email, String password) {
    return repository.login(email, password);
  }
}