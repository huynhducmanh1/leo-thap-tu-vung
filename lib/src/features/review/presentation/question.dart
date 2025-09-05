import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';

part 'question.freezed.dart';

// This is a sealed class that represents the different types of questions
// our review screen can display.
@freezed
abstract class Question with _$Question {

  /// A multiple choice question.
  /// It holds the correct word and a list of 4 options to choose from.
  const factory Question.multipleChoice({
    required VocabularyItem correctWord,
    required List<VocabularyItem> options,
  }) = MultipleChoiceQuestion;

  /// A typing question.
  /// It holds the word to be reviewed, and the user must type the answer.
  const factory Question.typing({
    required VocabularyItem wordToReview,
  }) = TypingQuestion;
}