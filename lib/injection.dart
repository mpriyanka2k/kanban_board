import 'package:get_it/get_it.dart';
import 'package:kanbanboard/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';
import 'package:kanbanboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/register_usecase.dart';
import 'package:kanbanboard/features/kanban/data/repositories/task_repository_impl.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/add_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/delete_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/get_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_status_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_usecase.dart';
import 'package:kanbanboard/services/firebase_service.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Core services
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService.instance);

  //Auth Repository
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(sl<FirebaseService>()));

  //Auth Usecase
  sl.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(sl<IAuthRepository>()));

  sl.registerLazySingleton<LogoutUsecase>(
      () => LogoutUsecase(sl<IAuthRepository>()));

  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(sl<IAuthRepository>()));

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(sl<FirebaseService>()));

  // Task Usecase
  sl.registerLazySingleton<AddTaskUsecase>(
      () => AddTaskUsecase(sl<TaskRepository>()));

  sl.registerLazySingleton<DeleteTaskUsecase>(
      () => DeleteTaskUsecase(sl<TaskRepository>()));

  sl.registerLazySingleton<GetTaskUsecase>(
      () => GetTaskUsecase(sl<TaskRepository>()));

  sl.registerLazySingleton<UpdateTaskStatusUsecase>(
      () => UpdateTaskStatusUsecase(sl<TaskRepository>()));

  sl.registerLazySingleton<UpdateTaskUsecase>(
      () => UpdateTaskUsecase(sl<TaskRepository>()));
}
