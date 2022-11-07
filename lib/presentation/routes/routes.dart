import 'package:firebase_why1/presentation/auth_gate/auth_gate.dart';
import 'package:firebase_why1/presentation/write/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthGate();
        },
      ),
      GoRoute(
        path: '/write',
        builder: (BuildContext context, GoRouterState state) {
          return const WriteScreen();
        },
      ),
    ],
  );