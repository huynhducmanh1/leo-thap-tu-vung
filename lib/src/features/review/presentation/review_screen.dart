import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/question.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_controller.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';
import 'package:leo_thap_tu_vung/src/theme/app_theme.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewControllerProvider);
    final reviewController = ref.read(reviewControllerProvider.notifier);

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

  Widget _buildQuestionArea(BuildContext context, WidgetRef ref, ReviewState reviewState) {
    final question = reviewState.currentQuestion!;

    if (reviewState.lastAnswerResult != null) {
      return _buildFeedbackCard(context, reviewState.lastAnswerResult!);
    }

    // Use .when to build the UI for the correct question type
    return question.when(
      multipleChoice: (correctWord, options) =>
          _buildMultipleChoiceUI(context, ref, correctWord, options),
      typing: (wordToReview) => _buildTypingUI(context, ref, wordToReview),
    );
  }

  Widget _buildMultipleChoiceUI(BuildContext context, WidgetRef ref, VocabularyItem prompt, List<VocabularyItem> options) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('TỪ NÀO CÓ NGHĨA LÀ?', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text(
          prompt.vietnameseMeaning,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        ...options.map((option) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => ref.read(reviewControllerProvider.notifier).submitAnswer(option),
              child: Text(option.word),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildTypingUI(BuildContext context, WidgetRef ref, VocabularyItem prompt) {
    final answerController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('NGHĨA LÀ GÌ?', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text(
          prompt.vietnameseMeaning,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        TextField(
          controller: answerController,
          decoration: const InputDecoration(hintText: 'Nhập câu trả lời của bạn...'),
          onSubmitted: (value) => ref.read(reviewControllerProvider.notifier).submitAnswer(value),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => ref.read(reviewControllerProvider.notifier).submitAnswer(answerController.text),
            child: const Text('Kiểm tra'),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackCard(BuildContext context, AnswerResult result) {
    return Card(
      color: result.wasCorrect ? AppTheme.successGreen.withOpacity(0.1) : AppTheme.errorRed.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.wasCorrect ? 'CHÍNH XÁC!' : 'CHƯA ĐÚNG',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: result.wasCorrect ? AppTheme.successGreen : AppTheme.errorRed,
                  ),
            ),
            const Divider(height: 16),
            Text('Đáp án đúng: ${result.correctAnswer.word}'),
            const SizedBox(height: 8),
            Text('Loại từ: ${result.correctAnswer.wordType.name}'),
            const SizedBox(height: 8),
            Text('English Definition: ${result.correctAnswer.englishDefinition}'),
            const SizedBox(height: 8),
            Text('SRS Stage: ${result.updatedProgress.srsStage}'),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context, WidgetRef ref, bool isLastCard) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (isLastCard) {
              context.go('/review-summary');
            } else {
              ref.read(reviewControllerProvider.notifier).nextItem();
            }
          },
          child: Text(isLastCard ? 'Xem tổng kết' : 'Tiếp tục'),
        ),
      ),
    );
  }
}