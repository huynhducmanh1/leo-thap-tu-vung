import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_thap_tu_vung/src/models/achievement.dart'; // Added Import
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';

class DatabaseRepository {
  DatabaseRepository(this._firestore);
  final FirebaseFirestore _firestore;

  DocumentReference<UserProfile> _userProfileRef(String userId) => _firestore
      .collection('users')
      .doc(userId)
      .withConverter(
        fromFirestore: (snapshot, _) => UserProfile.fromJson(snapshot.data()!),
        toFirestore: (profile, _) => profile.toJson(),
      );

  CollectionReference<UserProgress> _userProgressRef(String userId) => _firestore
      .collection('users')
      .doc(userId)
      .collection('user_progress')
      .withConverter(
        fromFirestore: (snapshot, _) => UserProgress.fromJson(snapshot.data()!),
        toFirestore: (progress, _) => progress.toJson(),
      );

  Future<void> createUserProfile(User user) {
    final profile = UserProfile(id: user.uid, email: user.email ?? '');
    return _userProfileRef(user.uid).set(profile);
  }

  Stream<UserProfile> watchUserProfile({required String userId}) {
    return _userProfileRef(userId).snapshots().map((snapshot) => snapshot.data()!);
  }
  
  Future<void> setActiveCourse({ required String userId, required String courseId, }) {
    return _firestore.collection('users').doc(userId).update({
      'activeCourseId': courseId,
    });
  }

  Future<void> updateUserProgress({
    required UserProgress progress,
    required String userId,
  }) {
    return _userProgressRef(userId).doc(progress.vocabularyId).set(progress);
  }

  Future<List<UserProgress>> getReviewQueue({required String userId}) {
    return _userProgressRef(userId)
        .where('nextReviewDate', isLessThanOrEqualTo: DateTime.now())
        .get()
        .then((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> incrementXpForUser({required String userId, int amount = 1}) async {
     // Simple XP increment if needed separately
     final profileRef = _userProfileRef(userId);
     return _firestore.runTransaction((transaction) async {
       final snapshot = await transaction.get(profileRef);
       final profile = snapshot.data()!;
       transaction.update(profileRef, {'xp': profile.xp + amount});
     });
  }

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
        // Convert to ISO string to be safe with dynamic map types
        updates['lastStudyDate'] = DateTime.now().toIso8601String(); 
      }

      if (newAchievements != null && newAchievements.isNotEmpty) {
        final currentUnlocked = List<String>.from(profile.unlockedAchievements);
        currentUnlocked.addAll(newAchievements.map((a) => a.id));
        updates['unlockedAchievements'] = currentUnlocked;
        
        int xpGained = 0;
        for (var achievement in newAchievements) {
           xpGained += achievement.requiredValue * 5; 
        }
        updates['xp'] = profile.xp + xpGained;
      }

      transaction.update(userRef, updates);
    });
  }
}