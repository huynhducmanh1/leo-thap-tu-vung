import 'dart:math';

import 'package:leo_thap_tu_vung/src/models/user_progress.dart';

/// Enhanced SRS Service with adaptive intervals and difficulty adjustments
class SrsService {
  // Base intervals for each SRS stage (in hours)
  static const Map<int, int> _baseSrsIntervals = {
    1: 4,      // Apprentice 1
    2: 8,      // Apprentice 2  
    3: 24,     // Apprentice 3
    4: 48,     // Apprentice 4
    5: 168,    // Guru 1 (1 week)
    6: 336,    // Guru 2 (2 weeks)
    7: 720,    // Master (1 month)
    8: 2880,   // Enlightened (4 months)
  };

  /// Enhanced stage calculation with streak bonuses
  int getNewStage({
    required int currentStage, 
    required bool wasCorrect,
    int correctStreak = 0,
  }) {
    if (wasCorrect) {
      // Bonus progression for streaks
      int progression = 1;
      if (correctStreak >= 5) progression = 2;
      
      return min(9, currentStage + progression);
    } else {
      // Adaptive demotion based on stage and streak
      if (currentStage <= 4) {
        return max(1, currentStage - 1);
      } else {
        int demotion = correctStreak >= 3 ? 1 : 2;
        return max(1, currentStage - demotion);
      }
    }
  }

  /// Calculate difficulty multiplier based on performance
  double calculateDifficultyMultiplier({
    required int totalReviews,
    required int correctReviews,
    required double currentMultiplier,
  }) {
    if (totalReviews < 3) return currentMultiplier;
    
    double accuracy = correctReviews / totalReviews;
    
    if (accuracy >= 0.9) {
      return min(2.0, currentMultiplier * 1.1);
    } else if (accuracy <= 0.6) {
      return max(0.5, currentMultiplier * 0.9);
    }
    
    return currentMultiplier;
  }

  /// Enhanced next review date calculation
  DateTime calculateNextReviewDate({
    required int currentStage,
    required bool wasCorrect,
    required double difficultyMultiplier,
    int correctStreak = 0,
  }) {
    final newStage = getNewStage(
      currentStage: currentStage,
      wasCorrect: wasCorrect,
      correctStreak: correctStreak,
    );

    if (newStage >= 9) {
      return DateTime.now().add(const Duration(days: 365 * 100));
    }

    int baseHours = _baseSrsIntervals[newStage]!;
    
    // Apply difficulty multiplier
    double adjustedHours = baseHours * difficultyMultiplier;
    
    // Add some randomization to prevent bunching
    double randomFactor = 0.8 + (Random().nextDouble() * 0.4); // 0.8 to 1.2
    adjustedHours *= randomFactor;

    return DateTime.now().add(Duration(hours: adjustedHours.round()));
  }

  /// Enhanced review processing
  UserProgress processReview({
    required UserProgress userProgress,
    required bool wasCorrect,
  }) {
    final newStage = getNewStage(
      currentStage: userProgress.srsStage,
      wasCorrect: wasCorrect,
      correctStreak: userProgress.correctStreak,
    );

    final newCorrectStreak = wasCorrect 
        ? userProgress.correctStreak + 1 
        : 0;

    final newDifficultyMultiplier = calculateDifficultyMultiplier(
      totalReviews: userProgress.totalReviews + 1,
      correctReviews: userProgress.correctReviews + (wasCorrect ? 1 : 0),
      currentMultiplier: userProgress.difficultyMultiplier,
    );

    final newReviewDate = calculateNextReviewDate(
      currentStage: userProgress.srsStage,
      wasCorrect: wasCorrect,
      difficultyMultiplier: newDifficultyMultiplier,
      correctStreak: newCorrectStreak,
    );

    return userProgress.copyWith(
      srsStage: newStage,
      nextReviewDate: newReviewDate,
      correctStreak: newCorrectStreak,
      totalReviews: userProgress.totalReviews + 1,
      correctReviews: userProgress.correctReviews + (wasCorrect ? 1 : 0),
      difficultyMultiplier: newDifficultyMultiplier,
      lastReviewDate: DateTime.now(),
      isLearned: newStage >= 9,
    );
  }
}