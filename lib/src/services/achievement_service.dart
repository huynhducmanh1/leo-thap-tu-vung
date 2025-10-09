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
      const Achievement(
        id: 'streak_30',
        title: 'Tháng kiên trì',
        description: 'Học liên tục 30 ngày',
        iconName: 'emoji_events',
        requiredValue: 30,
        type: AchievementType.streak,
      ),
      
      // Word achievements
      const Achievement(
        id: 'words_50',
        title: 'Người mới bắt đầu',
        description: 'Học được 50 từ vựng',
        iconName: 'school',
        requiredValue: 50,
        type: AchievementType.totalWords,
      ),
      const Achievement(
        id: 'words_200',
        title: 'Học giả nhỏ',
        description: 'Học được 200 từ vựng',
        iconName: 'auto_stories',
        requiredValue: 200,
        type: AchievementType.totalWords,
      ),
      const Achievement(
        id: 'words_500',
        title: 'Bậc thầy từ vựng',
        description: 'Học được 500 từ vựng',
        iconName: 'military_tech',
        requiredValue: 500,
        type: AchievementType.totalWords,
      ),

      // Level achievements
      const Achievement(
        id: 'level_5',
        title: 'Thăng cấp',
        description: 'Đạt cấp độ 5',
        iconName: 'trending_up',
        requiredValue: 5,
        type: AchievementType.levelReached,
      ),
      const Achievement(
        id: 'level_10',
        title: 'Chuyên gia',
        description: 'Đạt cấp độ 10',
        iconName: 'stars',
        requiredValue: 10,
        type: AchievementType.levelReached,
      ),
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
          shouldUnlock = userProfile.currentStreak >= achievement.requiredValue ||
                        userProfile.longestStreak >= achievement.requiredValue;
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
        case AchievementType.perfectDays:
          // This would require more complex tracking
          break;
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
    switch (achievement.type) {
      case AchievementType.streak:
        return achievement.requiredValue * 5;
      case AchievementType.totalWords:
        return achievement.requiredValue ~/ 10;
      case AchievementType.levelReached:
        return achievement.requiredValue * 10;
      default:
        return 50;
    }
  }
}