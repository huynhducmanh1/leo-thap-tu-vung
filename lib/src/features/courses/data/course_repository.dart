import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leo_thap_tu_vung/src/models/course.dart';

class CourseRepository {
  // In a real app, this might fetch from Firestore. For now, it's a fixed list.
  Future<List<Course>> getAvailableCourses() async {
    return [
      const Course(
        id: 'ielts',
        title: 'IELTS Vocabulary',
        description: 'Master the essential vocabulary for the IELTS exam.',
        totalWords: '10 Words (Test)',
      ),
      const Course(
        id: 'toefl',
        title: 'TOEFL Vocabulary',
        description: 'Essential words for the Test of English as a Foreign Language.',
        totalWords: 'Coming Soon',
      ),
      const Course(
        id: 'sat',
        title: 'SAT Vocabulary',
        description: 'High-level vocabulary for the Scholastic Aptitude Test.',
        totalWords: 'Coming Soon',
      ),
      const Course(
        id: 'gre',
        title: 'GRE Vocabulary',
        description: 'Advanced vocabulary for the Graduate Record Examinations.',
        totalWords: 'Coming Soon',
      ),
    ];
  }
}

// Create a provider for this repository
final courseRepositoryProvider = Provider((ref) => CourseRepository());