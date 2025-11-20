import 'package:leo_thap_tu_vung/src/models/achievement.dart';
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';

class AchievementService {
  static List<Achievement> getAllAchievements() {
    return [
      // Streak achievements
      const Achievement(
        id: 'streak_3',
        title: 'Khởi đầu tốt',
        description: 'Học liên tục 3 ngày',
        iconName: 'local_fire_department',
        requiredValue: 3,
        type: AchievementType.streak,
      ),
      const Achievement(
        id: 'streak_7',
        title: 'Tuần hoàn hảo',
        description: 'Học liên tục 7 ngày',
        iconName: 'whatshot',
        requiredValue: 7,
        type: AchievementType.streak,
      ),
      // Add other achievements here as needed...
    ];
  }

  static List<Achievement> checkForNewAchievements({
    required UserProfile userProfile,
    required List<String> currentUnlockedIds,
  }) {
    final allAchievements = getAllAchievements();
    final newAchievements = <Achievement>[];

    for (final achievement in allAchievements) {
      if (currentUnlockedIds.contains(achievement.id)) continue;

      bool shouldUnlock = false;

      switch (achievement.type) {
        case AchievementType.streak:
          shouldUnlock = userProfile.currentStreak >= achievement.requiredValue;
          break;
        case AchievementType.totalWords:
          shouldUnlock = userProfile.totalWordsLearned >= achievement.requiredValue;
          break;
        case AchievementType.levelReached:
          shouldUnlock = userProfile.level >= achievement.requiredValue;
          break;
        case AchievementType.reviewsCompleted:
          shouldUnlock = userProfile.totalReviewsCompleted >= achievement.requiredValue;
          break;
        default:
          shouldUnlock = false;
      }

      if (shouldUnlock) {
        newAchievements.add(achievement.copyWith(
          isUnlocked: true,
          unlockedAt: DateTime.now(),
        ));
      }
    }

    return newAchievements;
  }
  
  static int calculateXpReward(Achievement achievement) {
     // Simple logic: base XP on the requirement difficulty
     return achievement.requiredValue * 5;
  }
}