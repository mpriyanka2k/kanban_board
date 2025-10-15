import 'package:get_it/get_it.dart';
import 'package:kanbanboard/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kanbanboard/features/auth/domain/repositories/auth_repository.dart';
import 'package:kanbanboard/features/auth/domain/usecases/auth_usecase.dart';
import 'package:kanbanboard/features/kanban/data/repositories/task_repository_impl.dart';
import 'package:kanbanboard/features/kanban/domain/repositories/task_repository.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/task_usecase.dart';

final sl = GetIt.instance;
Future<void> init() async {

  //Auth Repository
  sl.registerLazySingleton<IAuthRepository>(() => AuthRepositoryImpl());

  //Auth Usecase
  sl.registerLazySingleton<AuthUsecase>(() => AuthUsecase(sl<IAuthRepository>()));  

  // Task Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());

  // Task Usecase
  sl.registerLazySingleton<TaskUsecase>(() => TaskUsecase(sl<TaskRepository>()));


}