import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';

class DatabaseRepository {
  DatabaseRepository(this._firestore);
  final FirebaseFirestore _firestore;

  // This method now requires the userId to be passed in.
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
    required String userId, // Now required here
  }) {
    print("Attempting to update progress for vocab '${progress.vocabularyId}' for user '$userId'");
    return _userProgressRef(userId).doc(progress.vocabularyId).set(progress);
  }

  Future<List<UserProgress>> getReviewQueue({
    required String userId, // Now required here
  }) {
    print("Fetching review queue for user '$userId'");
    return _userProgressRef(userId)
        .where('nextReviewDate', isLessThanOrEqualTo: DateTime.now())
        .get()
        .then((snapshot) {
          print("Found ${snapshot.docs.length} items in review queue.");
          return snapshot.docs.map((doc) => doc.data()).toList();
        });
  }

  DocumentReference<UserProfile> _userProfileRef(String userId) => _firestore
      .collection('users')
      .doc(userId)
      .withConverter(
        fromFirestore: (snapshot, _) => UserProfile.fromJson(snapshot.data()!),
        toFirestore: (profile, _) => profile.toJson(),
      );

  Future<void> createUserProfile(User user) {
    final profile = UserProfile(id: user.uid, email: user.email ?? '');
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

  Future<void> incrementXpForUser({required String userId, int amount = 1}) async {
    final profileRef = _userProfileRef(userId);
    const xpPerLevel = 10; // Let's say it takes 10 XP to level up for now.

    return _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(profileRef);
      final profile = snapshot.data()!;

      final newXp = profile.xp + amount;

      if (newXp >= xpPerLevel) {
        // Level up!
        final newLevel = profile.level + 1;
        final remainingXp = newXp - xpPerLevel;
        transaction.update(profileRef, {'level': newLevel, 'xp': remainingXp});
      } else {
        // Just increment XP
        transaction.update(profileRef, {'xp': newXp});
      }
    });
  }
}