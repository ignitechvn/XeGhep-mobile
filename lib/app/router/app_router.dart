import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/otp_verification_page.dart';
import '../../features/auth/presentation/pages/kyc_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/forgot_password_otp_page.dart';
import '../../features/auth/presentation/pages/reset_password_page.dart';
import '../../features/auth/presentation/pages/reset_password_success_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/register_otp_page.dart';
import '../../features/auth/presentation/pages/register_kyc_page.dart';
import '../../features/auth/presentation/pages/register_success_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/marketplace/presentation/pages/marketplace_page.dart';
import '../../features/marketplace/presentation/pages/post_customer_page.dart';
import '../../features/rides/presentation/pages/rides_page.dart';
import '../../features/score/presentation/pages/score_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/support/presentation/pages/support_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../shared/widgets/main_navigation.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      // Auth Routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/otp-verification',
        name: 'otp-verification',
        builder: (context, state) {
          final phoneNumber = state.extra as String?;
          return OtpVerificationPage(phoneNumber: phoneNumber ?? '');
        },
      ),
      GoRoute(
        path: '/kyc',
        name: 'kyc',
        builder: (context, state) => const KycPage(),
      ),
      
      // Forgot Password Flow
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/forgot-password-otp',
        name: 'forgot-password-otp',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ForgotPasswordOtpPage(
            phoneNumber: extra['phoneNumber'] ?? '',
            type: extra['type'] ?? 'forgot_password',
          );
        },
      ),
      GoRoute(
        path: '/reset-password',
        name: 'reset-password',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ResetPasswordPage(
            phoneNumber: extra['phoneNumber'] ?? '',
            otp: extra['otp'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/reset-password-success',
        name: 'reset-password-success',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ResetPasswordSuccessPage(
            phoneNumber: extra['phoneNumber'] ?? '',
          );
        },
      ),
      
      // Register Flow
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/register-otp',
        name: 'register-otp',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return RegisterOtpPage(
            phoneNumber: extra['phoneNumber'] ?? '',
            password: extra['password'] ?? '',
            fullName: extra['fullName'] ?? '',
            email: extra['email'] ?? '',
            type: extra['type'] ?? 'register',
          );
        },
      ),
      GoRoute(
        path: '/register-kyc',
        name: 'register-kyc',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return RegisterKycPage(
            phoneNumber: extra['phoneNumber'] ?? '',
            password: extra['password'] ?? '',
            fullName: extra['fullName'] ?? '',
            email: extra['email'] ?? '',
            otp: extra['otp'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/register-success',
        name: 'register-success',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return RegisterSuccessPage(
            phoneNumber: extra['phoneNumber'] ?? '',
            fullName: extra['fullName'] ?? '',
          );
        },
      ),
      
      // Main App Routes with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) => MainNavigation(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/marketplace',
            name: 'marketplace',
            builder: (context, state) => const MarketplacePage(),
          ),
          GoRoute(
            path: '/post-customer',
            name: 'post-customer',
            builder: (context, state) => const PostCustomerPage(),
          ),
          GoRoute(
            path: '/rides',
            name: 'rides',
            builder: (context, state) => const RidesPage(),
          ),
          GoRoute(
            path: '/score',
            name: 'score',
            builder: (context, state) => const ScorePage(),
          ),
        ],
      ),
      
      // Profile Routes (without bottom navigation)
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/support',
        name: 'support',
        builder: (context, state) => const SupportPage(),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Trang không tồn tại',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Đường dẫn: ${state.uri.path}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Về trang chủ'),
            ),
          ],
        ),
      ),
    ),
  );
});
