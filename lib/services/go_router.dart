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
    // Global redirect logic for authentication
  redirect: (BuildContext context, GoRouterState state) {
    // Check if the user is currently logged in
    // This relies on the StreamBuilder in MyApp to ensure the initial state is determined.
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    // Identify if the user is trying to access one of the authentication routes
    final isAuthRoute = state.uri.path == '/login' || state.uri.path == '/register';

    // If the user is NOT logged in AND is NOT on an auth route, redirect to login.
    if (!isLoggedIn && !isAuthRoute) {
      return '/login';
    }

    // If the user IS logged in AND is trying to access an auth route, redirect to the kanban screen.
    if (isLoggedIn && isAuthRoute) {
      return '/kanban';
    }

    // Otherwise, return null to continue to the requested location (or '/')
    return null;
  }
);