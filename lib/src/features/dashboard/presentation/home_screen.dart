import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/dashboard/presentation/dashboard_controller.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_controller.dart';
import 'package:leo_thap_tu_vung/src/theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    final userEmail = authState.value?.email ?? 'bạn';

    final userProfileAsyncValue = ref.watch(userProfileProvider);
    final reviewState = ref.watch(reviewControllerProvider);
    final reviewCount = reviewState.reviewQueue.length;

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
                // The temporary seed button has been removed.
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Could not load user profile: $error')),
      ),
    );
  }

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