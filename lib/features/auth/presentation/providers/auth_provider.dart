import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/models/user_model.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<void> sendOtp(String phoneNumber) async {
    state = const AuthLoading();
    
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.sendOtp(phoneNumber);
      state = OtpSent(phoneNumber: phoneNumber);
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> verifyOtp(String phoneNumber, String otp) async {
    state = const AuthLoading();
    
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.verifyOtp(phoneNumber, otp);
      
      // Check if user needs to complete KYC
      if (response['requires_kyc'] == true) {
        state = const AuthRequiresKyc();
      } else {
        final user = await repository.getProfile();
        state = AuthAuthenticated(user: user);
      }
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> submitKyc(Map<String, dynamic> kycData) async {
    state = const AuthLoading();
    
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.submitKyc(kycData);
      final user = await repository.getProfile();
      state = AuthAuthenticated(user: user);
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthLoading();
    
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
      state = const AuthUnauthenticated();
    } catch (e) {
      state = AuthError(message: e.toString());
    }
  }

  Future<void> checkAuthStatus() async {
    final repository = ref.read(authRepositoryProvider);
    
    if (repository.isAuthenticated()) {
      try {
        final user = repository.getCachedProfile();
        if (user != null) {
          state = AuthAuthenticated(user: user);
        } else {
          final freshUser = await repository.getProfile();
          state = AuthAuthenticated(user: freshUser);
        }
      } catch (e) {
        state = const AuthUnauthenticated();
      }
    } else {
      state = const AuthUnauthenticated();
    }
  }
}

// Auth States
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthRequiresKyc extends AuthState {
  const AuthRequiresKyc();
}

class AuthAuthenticated extends AuthState {
  final UserModel user;
  
  const AuthAuthenticated({required this.user});
}

class OtpSent extends AuthState {
  final String phoneNumber;
  
  const OtpSent({required this.phoneNumber});
}

class AuthError extends AuthState {
  final String message;
  
  const AuthError({required this.message});
}
