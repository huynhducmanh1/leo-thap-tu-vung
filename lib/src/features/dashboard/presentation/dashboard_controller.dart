import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';

// This is now a StreamProvider that provides a live stream of UserProfile data.
final userProfileProvider = StreamProvider<UserProfile>((ref) {
  final userId = ref.watch(authStateChangesProvider).value?.uid;
  if (userId == null) {
    // If there's no user, return a stream that emits an error.
    return Stream.error('User not logged in');
  }
  // Otherwise, return the live stream of the user's profile.
  return ref.watch(databaseRepositoryProvider).watchUserProfile(userId: userId);
});