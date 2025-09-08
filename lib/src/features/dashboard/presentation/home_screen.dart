import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/courses/data/course_repository.dart';
import 'package:leo_thap_tu_vung/src/features/dashboard/presentation/dashboard_controller.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_controller.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';
import 'package:leo_thap_tu_vung/src/models/course.dart';
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';
import 'package:leo_thap_tu_vung/src/theme/app_theme.dart';

// Provider to fetch the list of available courses
final coursesProvider = FutureProvider<List<Course>>((ref) async {
  return ref.watch(courseRepositoryProvider).getAvailableCourses();
});


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    final userEmail = authState.value?.email ?? 'bạn';
    final userProfileAsyncValue = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Xin chào, $userEmail!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authRepositoryProvider).signOut();
            },
            tooltip: 'Đăng xuất',
          ),
        ],
      ),
      body: userProfileAsyncValue.when(
        data: (userProfile) {
          // --- NEW LOGIC ---
          // If the user has NOT selected a course yet, show the selection screen.
          if (userProfile.activeCourseId == null) {
            return _buildCourseSelectionBody(context, ref);
          }
          // Otherwise, show their regular dashboard.
          else {
            return _buildDashboardBody(context, ref, userProfile);
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Could not load user profile: $error')),
      ),
    );
  }

  // WIDGET FOR A RETURNING USER (shows their progress)
  Widget _buildDashboardBody(BuildContext context, WidgetRef ref, UserProfile userProfile) {
    final reviewState = ref.watch(reviewControllerProvider);
    final reviewCount = reviewState.reviewQueue.length;
    const xpPerLevel = 10;
    final progressPercentage = userProfile.xp / xpPerLevel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildLevelProgressCard(
            context: context,
            level: userProfile.level,
            xp: userProfile.xp,
            xpToNextLevel: xpPerLevel,
            progressPercentage: progressPercentage,
          ),
          const SizedBox(height: 32),
          _buildActionButton(
            context: context,
            icon: Icons.school,
            label: 'BÀI HỌC MỚI',
            count: 5,
            onPressed: () => context.go('/lesson'),
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            context: context,
            icon: Icons.reviews,
            label: 'ÔN TẬP',
            count: reviewCount,
            onPressed: reviewCount > 0 ? () => context.go('/review') : null,
            isPrimary: true,
          ),
        ],
      ),
    );
  }

  // WIDGET FOR A NEW USER (prompts them to select a course)
  Widget _buildCourseSelectionBody(BuildContext context, WidgetRef ref) {
    final coursesAsyncValue = ref.watch(coursesProvider);
    final user = ref.watch(authStateChangesProvider).value;

    return coursesAsyncValue.when(
      data: (courses) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hãy chọn một khóa học để bắt đầu!', // "Choose a course to begin!"
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(course.title, style: Theme.of(context).textTheme.titleLarge),
                      subtitle: Text('\n${course.description}\n${course.totalWords}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        if (user != null) {
                          await ref.read(databaseRepositoryProvider).setActiveCourse(
                                userId: user.uid,
                                courseId: course.id,
                              );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error loading courses: $err')),
    );
  }


  // --- HELPER WIDGETS (UNCHANGED) ---

  Widget _buildLevelProgressCard({
    required BuildContext context,
    required int level,
    required int xp,
    required int xpToNextLevel,
    required double progressPercentage,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CẤP ĐỘ $level', style: textTheme.bodyMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progressPercentage,
              minHeight: 12,
              borderRadius: BorderRadius.circular(6),
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text('$xp / $xpToNextLevel XP', style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int count,
    required VoidCallback? onPressed,
    bool isPrimary = false,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('$count'),
        ],
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: isPrimary ? Theme.of(context).colorScheme.primary : AppTheme.aquaTeal,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ).copyWith(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 60),
        ),
      ),
    );
  }
}