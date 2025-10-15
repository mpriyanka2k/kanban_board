

import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final IAuthRepository repository;

  LogoutUsecase(this.repository);

  Future<void> logout(){
    return repository.logout();
  }
}
