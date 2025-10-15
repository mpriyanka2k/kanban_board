import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kanbanboard/services/firebase_service.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {

    final FirebaseService _firebaseService = FirebaseService.instance;

   @override
  Future<AppUser?> login(String email, String password) async {
    final result = await _firebaseService.signIn(email, password);
    return AppUser(
      uid: result.user!.uid,
      email: result.user!.email!,
    );
  }

 @override
  Future<AppUser?> register(String email, String password) async {
    final result = await _firebaseService.createUser(email, password);
    final user = AppUser(uid: result.user!.uid, email: result.user!.email!);

    await _firebaseService.usersCollection().doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "createdAt": FieldValue.serverTimestamp(),
    });

    return user;
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseService.signOut();
    } catch (e) {
      print("Logout error: $e");
    }
  }
}