

import 'package:kanbanboard/features/auth/domain/entities/app_user.dart';

abstract class IAuthRepository {
  Future<AppUser?> login(String email, String password);
  Future<AppUser?> register(String email, String password);
  Future<void> logout();
}