import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kanbanboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kanbanboard/features/auth/domain/usecases/register_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/add_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/delete_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/get_task_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_status_usecase.dart';
import 'package:kanbanboard/features/kanban/domain/usecases/update_task_usecase.dart';
import 'package:kanbanboard/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/kanban/presentation/bloc/task_bloc.dart';
import '../services/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await init(); // initialize get_it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(sl<LoginUsecase>(),sl<LogoutUsecase>(),sl<RegisterUsecase>()),
            ),
            BlocProvider<TaskBloc>(
              create: (context) => TaskBloc(sl<AddTaskUsecase>(),sl<DeleteTaskUsecase>(),sl<GetTaskUsecase>(),sl<UpdateTaskStatusUsecase>(),sl<UpdateTaskUsecase>()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Kanban board',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              S.delegate, // Generated delegate
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            routerConfig: router,
          ),
        );
      },
    );
  }
}
