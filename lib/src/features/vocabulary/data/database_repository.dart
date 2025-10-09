import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';
import 'package:leo_thap_tu_vung/src/services/achievement_service.dart';

class DatabaseRepository {
  DatabaseRepository(this._firestore);
  final FirebaseFirestore _firestore;

  CollectionReference<UserProgress> _userProgressRef(String userId) => _firestore
      .collection('users')
      .doc(userId)
      .collection('user_progress')
      .withConverter(
        fromFirestore: (snapshot, _) => UserProgress.fromJson(snapshot.data()!),
        toFirestore: (progress, _) => progress.toJson(),
      );

  Future<void> updateUserProgress({
    required UserProgress progress,
    required String userId,
  }) {
    print("Updating progress for vocab '${progress.vocabularyId}' for user '$userId'");
    return _userProgressRef(userId).doc(progress.vocabularyId).set(progress);
  }

  Future<List<UserProgress>> getReviewQueue({
    required String userId,
    int? limit,
  }) {
    print("Fetching review queue for user '$userId'");
    var query = _userProgressRef(userId)
        .where('nextReviewDate', isLessThanOrEqualTo: DateTime.now())
        .where('isLearned', isEqualTo: false)
        .orderBy('nextReviewDate');
    
    if (limit != null) {
      query = query.limit(limit);
    }
    
    return query.get().then((snapshot) {
      print("Found ${snapshot.docs.length} items in review queue.");
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<Map<String, int>> getUserStats({required String userId}) async {
    final progressSnapshot = await _userProgressRef(userId).get();
    final allProgress = progressSnapshot.docs.map((doc) => doc.data()).toList();
    
    return {
      'totalWords': allProgress.length,
      'learnedWords': allProgress.where((p) => p.isLearned).length,
      'reviewsToday': allProgress.where((p) => 
        p.lastReviewDate?.day == DateTime.now().day &&
        p.lastReviewDate?.month == DateTime.now().month &&
        p.lastReviewDate?.year == DateTime.now().year
      ).length,
    };
  }

  DocumentReference<UserProfile> _userProfileRef(String userId) => _firestore
      .collection('users')
      .doc(userId)
      .withConverter(
        fromFirestore: (snapshot, _) => UserProfile.fromJson(snapshot.data()!),
        toFirestore: (profile, _) => profile.toJson(),
      );

  Future<void> createUserProfile(User user) {
    final profile = UserProfile(
      id: user.uid, 
      email: user.email ?? '',
      lastStudyDate: DateTime.now(),
    );
    return _userProfileRef(user.uid).set(profile);
  }

  Future<void> setActiveCourse({
    required String userId,
    required String courseId,
  }) {
    return _firestore.collection('users').doc(userId).update({
      'activeCourseId': courseId,
    });
  }

  Stream<UserProfile> watchUserProfile({required String userId}) {
    return _userProfileRef(userId).snapshots().map((snapshot) => snapshot.data()!);
  }

  Future<void> updateUserProfileAfterReview({
    required String userId,
    required bool wasCorrect,
    required int xpGained,
  }) async {
    final profileRef = _userProfileRef(userId);
    const xpPerLevel = 100; // Increased XP requirement
    final today = DateTime.now();

    return _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(profileRef);
      final profile = snapshot.data()!;

      // Calculate streak
      int newStreak = profile.currentStreak;
      final lastStudy = profile.lastStudyDate;
      
      if (lastStudy == null || 
          (today.difference(lastStudy).inDays == 1)) {
        newStreak = profile.currentStreak + 1;
      } else if (today.difference(lastStudy).inDays > 1) {
        newStreak = 1; // Reset streak
      }

      // Calculate new XP and level
      final newXp = profile.xp + xpGained;
      int newLevel = profile.level;
      int remainingXp = newXp;

      while (remainingXp >= xpPerLevel) {
        newLevel++;
        remainingXp -= xpPerLevel;
      }

      // Update profile
      final updatedProfile = profile.copyWith(
        xp: remainingXp,
        level: newLevel,
        currentStreak: newStreak,
        longestStreak: newStreak > profile.longestStreak ? newStreak : profile.longestStreak,
        totalReviewsCompleted: profile.totalReviewsCompleted + 1,
        lastStudyDate: today,
      );

      // Check for new achievements
      final newAchievements = AchievementService.checkForNewAchievements(
        userProfile: updatedProfile,
        currentUnlockedIds: profile.unlockedAchievements,
      );

      if (newAchievements.isNotEmpty) {
        final newUnlockedIds = [
          ...profile.unlockedAchievements,
          ...newAchievements.map((a) => a.id),
        ];
        
        // Add achievement XP
        int achievementXp = 0;
        for (final achievement in newAchievements) {
          achievementXp += AchievementService.calculateXpReward(achievement);
        }

        final finalProfile = updatedProfile.copyWith(
          unlockedAchievements: newUnlockedIds,
          xp: updatedProfile.xp + achievementXp,
        );

        transaction.update(profileRef, finalProfile.toJson());
      } else {
        transaction.update(profileRef, updatedProfile.toJson());
      }
    });
  }

  Future<void> updateWordsLearnedCount({required String userId}) async {
    final progressSnapshot = await _userProgressRef(userId)
        .where('isLearned', isEqualTo: true)
        .get();
    
    final learnedCount = progressSnapshot.docs.length;
    
    await _userProfileRef(userId).update({
      'totalWordsLearned': learnedCount,
    });
  }
}