import 'package:get_it/get_it.dart';
import 'package:kanbanboard/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';
import 'package:kanbanboard/features/auth/domain/usecases/auth_usecase.dart';
import 'package:kanbanboard/features/kanban/data/repositories/task_repository_impl.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/task_usecase.dart';
import 'package:kanbanboard/services/firebase_service.dart';

final sl = GetIt.instance;
Future<void> init() async {

    // Core services
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService.instance);

  //Auth Repository
  sl.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(sl<FirebaseService>()));

  //Auth Usecase
  sl.registerLazySingleton<AuthUsecase>(() => AuthUsecase(sl<IAuthRepository>()));  

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl<FirebaseService>()));

  // Task Usecase
  sl.registerLazySingleton<TaskUsecase>(() => TaskUsecase(sl<TaskRepository>()));


}