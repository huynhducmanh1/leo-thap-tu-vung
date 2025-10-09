import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leo_thap_tu_vung/src/routing/app_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // We use a white background for a clean, modern look
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Our new navigation bar
            _LandingNavBar(),

            // TODO: We will add the rest of the landing page content here later
            SizedBox(height: 100),
            Text(
              'Landing Page Content Goes Here',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

// A private widget for the navigation bar
class _LandingNavBar extends StatelessWidget {
  const _LandingNavBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 1. Logo
          const Row(
            children: [
              Icon(Icons.school, color: Colors.deepPurple, size: 32),
              SizedBox(width: 8),
              Text(
                'Leo Tháp Từ Vựng',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // 2. Sign In and Join Us Buttons
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Navigate to the login screen
                  context.goNamed(AppRoute.login.name);
                },
                child: const Text(
                  'Đăng Nhập', // "Sign In"
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the registration screen
                  context.goNamed(AppRoute.register.name);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tham Gia Ngay', // "Join Us"
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}