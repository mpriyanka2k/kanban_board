import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanbanboard/features/auth/presentation/UI/screens/login_screen.dart';
import 'package:kanbanboard/features/auth/presentation/UI/screens/register_screen.dart';
import 'package:kanbanboard/features/kanban/presentation/UI/Screen/kanban_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
     GoRoute(
      path: '/kanban',
      builder: (context, state) => KanbanBoardScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    final isAuthRoute = state.uri.path == '/login' || state.uri.path == '/register';

    if (!isLoggedIn && !isAuthRoute) {
      return '/login';
    }

    if (isLoggedIn && isAuthRoute) {
      return '/kanban';
    }

    return null;
  }
);