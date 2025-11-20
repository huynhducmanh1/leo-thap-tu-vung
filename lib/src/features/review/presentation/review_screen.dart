import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/question.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_controller.dart';
import 'package:leo_thap_tu_vung/src/services/audio_service.dart';
import 'package:leo_thap_tu_vung/src/theme/app_theme.dart';
// Ensure you import your Achievement model if you use it in UI

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewControllerProvider);
    final reviewController = ref.read(reviewControllerProvider.notifier);

    // Listen for new achievements to show a dialog
    ref.listen(reviewControllerProvider, (previous, next) {
      final result = next.lastAnswerResult;
      if (result != null && result.newAchievements.isNotEmpty) {
        // Show the first new achievement
        final achievement = result.newAchievements.first;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.emoji_events, color: Colors.amber),
                const SizedBox(width: 8),
                Expanded(child: Text('Danh hiệu mới: ${achievement.title}!')),
              ],
            ),
            backgroundColor: AppTheme.primaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    if (reviewState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (reviewState.reviewQueue.isEmpty && !reviewState.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Ôn tập')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Không có từ nào cần ôn tập ngay bây giờ!'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/home'),
                child: const Text('Quay về trang chủ'),
              ),
            ],
          ),
        ),
      );
    }

    final isLastCard = reviewState.currentIndex == reviewState.reviewQueue.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ôn tập'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (reviewState.currentIndex + 1) / reviewState.reviewQueue.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: reviewState.currentQuestion == null
                    ? const Center(child: CircularProgressIndicator())
                    : _buildQuestionArea(context, ref, reviewState),
              ),
            ),
            if (reviewState.lastAnswerResult != null)
              _buildNextButton(context, ref, isLastCard),
          ],
        ),
      ),
    );
  }
  
  // ... keep your existing _buildQuestionArea, _buildMultipleChoiceUI, _buildTypingUI ...
  
  Widget _buildQuestionArea(BuildContext context, WidgetRef ref, ReviewState reviewState) {
      final question = reviewState.currentQuestion!;
      
      if (reviewState.lastAnswerResult != null) {
        return _buildFeedbackCard(context, ref, reviewState.lastAnswerResult!);
      }

      return question.when(
        multipleChoice: (correctWord, options) =>
            _buildMultipleChoiceUI(context, ref, correctWord, options),
        typing: (wordToReview) => _buildTypingUI(context, ref, wordToReview),
      );
    }

    // ... Ensure these methods exist (copy from your previous file) ...
    Widget _buildMultipleChoiceUI(BuildContext context, WidgetRef ref, dynamic correctWord, dynamic options) {
       // ... implementation ...
       return Container(); // Placeholder
    }
    Widget _buildTypingUI(BuildContext context, WidgetRef ref, dynamic wordToReview) {
       // ... implementation ...
       return Container(); // Placeholder
    }

    Widget _buildFeedbackCard(BuildContext context, WidgetRef ref, AnswerResult result) {
    return Card(
      color: result.wasCorrect ? AppTheme.successGreen.withOpacity(0.1) : AppTheme.errorRed.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( result.wasCorrect ? 'CHÍNH XÁC!' : 'CHƯA ĐÚNG',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: result.wasCorrect ? AppTheme.successGreen : AppTheme.errorRed,
                  ),
            ),
            const Divider(height: 16),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Đáp án đúng: ',
                      children: <TextSpan>[
                        TextSpan(
                          text: result.correctAnswer.word,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () {
                    final audioService = ref.read(audioServiceProvider);
                    audioService.playAudioFromUrl(result.correctAnswer.pronunciationAudioUrl);
                  },
                ),
              ],
            ),
            // ... rest of your fields ...
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, WidgetRef ref, bool isLastCard) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
           ref.read(reviewControllerProvider.notifier).nextItem();
        },
        child: Text(isLastCard ? 'Hoàn thành' : 'Tiếp theo'),
      ),
    );
  }
}