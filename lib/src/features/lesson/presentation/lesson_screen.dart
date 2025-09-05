import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/lesson/presentation/lesson_controller.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';
import 'package:leo_thap_tu_vung/src/models/word_type.dart';

class LessonScreen extends ConsumerWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonState = ref.watch(lessonControllerProvider);
    final lessonController = ref.read(lessonControllerProvider.notifier);
    final pageController = PageController();

    if (lessonState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (lessonState.errorMessage != null) {
      return Scaffold(body: Center(child: Text(lessonState.errorMessage!)));
    }

    final isLastCard = lessonState.currentIndex == lessonState.words.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài học mới'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (lessonState.currentIndex + 1) / lessonState.words.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 16),
            // The Flashcards
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(), // Disable swiping
                itemCount: lessonState.words.length,
                itemBuilder: (context, index) {
                  return LessonCard(word: lessonState.words[index]);
                },
              ),
            ),
            // The Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isLastCard) {
                    lessonController.completeLessonSession().then((_) {
                      context.go('/home');
                    });
                  } else {
                    lessonController.nextWord();
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(isLastCard ? 'Hoàn thành' : 'Tiếp tục'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// A widget for displaying a single vocabulary flashcard
class LessonCard extends StatefulWidget {
  const LessonCard({super.key, required this.word});
  final VocabularyItem word;

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  bool _showEnglishDefinition = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // English Word
              Text(widget.word.word, style: textTheme.displayLarge),
              const SizedBox(height: 8),
              // Word Type and Phonetic
              Text(
                '${widget.word.wordType.name} | ${widget.word.ipaPhonetic}',
                style: textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
              const Divider(height: 32, thickness: 1),
              // Vietnamese Meaning
              Text('NGHĨA TIẾNG VIỆT', style: textTheme.bodyMedium),
              Text(widget.word.vietnameseMeaning, style: textTheme.headlineMedium),
              const SizedBox(height: 24),
              // English Definition (Toggleable)
              Row(
                children: [
                  Text('ENGLISH DEFINITION', style: textTheme.bodyMedium),
                  IconButton(
                    icon: Icon(
                      _showEnglishDefinition ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _showEnglishDefinition = !_showEnglishDefinition),
                  )
                ],
              ),
              if (_showEnglishDefinition)
                Text(widget.word.englishDefinition, style: textTheme.bodyLarge),
              const SizedBox(height: 24),
              // Example Sentence
              Text('VÍ DỤ', style: textTheme.bodyMedium),
              Text(widget.word.exampleSentence, style: textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}