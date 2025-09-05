import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/theme/app_theme.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: AppTheme.successGreen,
                size: 100,
              ),
              const SizedBox(height: 32),
              Text(
                'Hoàn thành!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'Bạn đã ôn tập xong tất cả các từ. Hãy tiếp tục cố gắng nhé!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/home'),
                  child: const Text('Quay về trang chủ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}