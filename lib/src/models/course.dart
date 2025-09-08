import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
abstract class Course with _$Course {
  const factory Course({
    required String id, // e.g., "ielts"
    required String title, // e.g., "IELTS Vocabulary"
    required String description, // e.g., "Master the essential vocabulary for the IELTS exam."
    required String totalWords, // e.g., "500 Words"
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}