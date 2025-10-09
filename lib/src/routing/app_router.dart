import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/login_screen.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/registration_screen.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/splash_screen.dart';
import 'package:leo_thap_tu_vung/src/features/dashboard/presentation/home_screen.dart';
import 'package:leo_thap_tu_vung/src/features/landing/presentation/landing_screen.dart';
import 'package:leo_thap_tu_vung/src/features/lesson/presentation/lesson_screen.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_screen.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_summary_screen.dart';

enum AppRoute {
  splash,
  landing,
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
    // CORRECTED: Use ref.watch(provider.stream) to get the raw stream
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authStateChangesProvider.stream),
    ),
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = authState.value != null;
      final onAuthRoute = state.matchedLocation == '/' ||
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (authState.isLoading || authState.hasError) {
        // Show splash screen while loading
        if (state.matchedLocation != '/splash') return '/splash';
        return null;
      }

      if (state.matchedLocation == '/splash') {
        return loggedIn ? '/home' : '/';
      }

      if (loggedIn && onAuthRoute) {
        return '/home';
      }

      if (!loggedIn && !onAuthRoute) {
        return '/';
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
        path: '/',
        name: AppRoute.landing.name,
        builder: (context, state) => const LandingScreen(),
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
      GoRoute(
        path: '/review',
        name: AppRoute.review.name,
        builder: (context, state) => const ReviewScreen(),
      ),
      GoRoute(
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