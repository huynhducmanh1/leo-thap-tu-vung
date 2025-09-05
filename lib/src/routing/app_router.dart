import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/login_screen.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/registration_screen.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/splash_screen.dart';
import 'package:leo_thap_tu_vung/src/features/dashboard/presentation/home_screen.dart';
import 'package:leo_thap_tu_vung/src/features/lesson/presentation/lesson_screen.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_screen.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_summary_screen.dart';


enum AppRoute {
  splash,
  login,
  register,
  home,
  lesson,
  review,
  reviewSummary,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authStateChangesProvider.stream),
    ),
    redirect: (BuildContext context, GoRouterState state) {
      // NEW: If the auth state is still loading, don't redirect anywhere.
      // The SplashScreen will be shown.
      if (authState.isLoading || authState.hasError) {
        return null;
      }

      final loggedIn = authState.value != null;
      final onAuthScreen =
          state.matchedLocation == '/login' || state.matchedLocation == '/register';

      // If the user is on the splash screen AFTER the auth state has resolved,
      // decide where to go.
      if (state.matchedLocation == '/splash') {
        return loggedIn ? '/home' : '/login';
      }

      if (!loggedIn && !onAuthScreen) {
        return '/login';
      }

      if (loggedIn && onAuthScreen) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRoute.register.name,
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/lesson',
        name: AppRoute.lesson.name,
        builder: (context, state) => const LessonScreen(),
      ),
      GoRoute( // <-- ADD THIS ENTIRE BLOCK
        path: '/review',
        name: AppRoute.review.name,
        builder: (context, state) => const ReviewScreen(),
      ),
      GoRoute( // <-- ADD THIS ENTIRE BLOCK
        path: '/review-summary',
        name: AppRoute.reviewSummary.name,
        builder: (context, state) => const ReviewSummaryScreen(),
      ),
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}