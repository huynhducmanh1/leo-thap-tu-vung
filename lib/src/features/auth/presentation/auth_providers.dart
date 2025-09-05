import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leo_thap_tu_vung/src/features/auth/data/auth_repository.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';

// Provider for the FirebaseAuth instance
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Provider for our AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(firebaseAuthProvider),
    ref.watch(databaseRepositoryProvider),
  );
});

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(authRepositoryProvider).authStateChanges());