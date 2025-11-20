import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// This provider no longer needs to know about the user's auth state.
final databaseRepositoryProvider = Provider<DatabaseRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return DatabaseRepository(firestore);
});

  Future<void> updateUserStats({
    required String userId,
    required int wordsLearnedDelta,
    required int reviewsCompletedDelta,
    required bool streakUpdated,
    required int newStreak,
    List<Achievement>? newAchievements,
  }) async {
    final userRef = _userProfileRef(userId);

    return _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userRef);
      final profile = snapshot.data()!;
      
      final updates = <String, dynamic>{
        'totalWordsLearned': profile.totalWordsLearned + wordsLearnedDelta,
        'totalReviewsCompleted': profile.totalReviewsCompleted + reviewsCompletedDelta,
      };

      if (streakUpdated) {
        updates['currentStreak'] = newStreak;
        if (newStreak > profile.longestStreak) {
           updates['longestStreak'] = newStreak;
        }
        updates['lastStudyDate'] = DateTime.now().toIso8601String(); // Store as String or Timestamp depending on your model
      }

      if (newAchievements != null && newAchievements.isNotEmpty) {
        // Add new achievement IDs to the list
        final currentUnlocked = List<String>.from(profile.unlockedAchievements);
        currentUnlocked.addAll(newAchievements.map((a) => a.id));
        updates['unlockedAchievements'] = currentUnlocked;
        
        // Give XP for achievements
        int xpGained = 0;
        for (var achievement in newAchievements) {
           // You might want to move calculateXpReward logic here or pass it in
           xpGained += achievement.requiredValue * 5; 
        }
        updates['xp'] = profile.xp + xpGained;
      }

      transaction.update(userRef, updates);
    });
  }