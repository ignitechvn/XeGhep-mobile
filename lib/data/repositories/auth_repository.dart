import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_client.dart';
import '../../core/storage/local_storage.dart';
import '../../data/models/user_model.dart';
import '../../app/constants/app_constants.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    apiClient: ref.watch(apiClientProvider),
    localStorage: LocalStorage.instance,
  );
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  return ApiClientFactory.create();
}

class AuthRepository {
  final ApiClient _apiClient;
  final LocalStorage _localStorage;

  AuthRepository({
    required ApiClient apiClient,
    required LocalStorage localStorage,
  }) : _apiClient = apiClient,
       _localStorage = localStorage;

  // Send OTP
  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    try {
      final response = await _apiClient.sendOtp({
        'phone_number': phoneNumber,
      });
      return response;
    } catch (e) {
      throw Exception('Không thể gửi mã OTP: $e');
    }
  }

  // Verify OTP
  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await _apiClient.verifyOtp({
        'phone_number': phoneNumber,
        'otp': otp,
      });

      // Save tokens
      if (response['access_token'] != null) {
        await _localStorage.saveAuthToken(response['access_token']);
      }
      if (response['refresh_token'] != null) {
        await _localStorage.saveRefreshToken(response['refresh_token']);
      }

      return response;
    } catch (e) {
      throw Exception('Mã OTP không hợp lệ: $e');
    }
  }

  // Submit KYC
  Future<DriverModel> submitKyc(Map<String, dynamic> kycData) async {
    try {
      final driver = await _apiClient.submitKyc(kycData);
      return driver;
    } catch (e) {
      throw Exception('Không thể xác thực thông tin: $e');
    }
  }

  // Get user profile
  Future<UserModel> getProfile() async {
    try {
      final user = await _apiClient.getProfile();
      await _localStorage.saveUserProfile(user);
      return user;
    } catch (e) {
      throw Exception('Không thể lấy thông tin người dùng: $e');
    }
  }

  // Update profile
  Future<UserModel> updateProfile(Map<String, dynamic> profileData) async {
    try {
      final user = await _apiClient.updateProfile(profileData);
      await _localStorage.saveUserProfile(user);
      return user;
    } catch (e) {
      throw Exception('Không thể cập nhật thông tin: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _apiClient.logout();
    } catch (e) {
      // Continue with local logout even if API call fails
    } finally {
      await _localStorage.clearAuth();
    }
  }

  // Check if user is authenticated
  bool isAuthenticated() {
    return _localStorage.getAuthToken() != null;
  }

  // Get cached user profile
  UserModel? getCachedProfile() {
    return _localStorage.getUserProfile();
  }

  // Refresh token
  Future<void> refreshToken() async {
    try {
      final refreshToken = _localStorage.getRefreshToken();
      if (refreshToken == null) {
        throw Exception('No refresh token available');
      }

      final response = await _apiClient.refreshToken({
        'refresh_token': refreshToken,
      });

      if (response['access_token'] != null) {
        await _localStorage.saveAuthToken(response['access_token']);
      }
      if (response['refresh_token'] != null) {
        await _localStorage.saveRefreshToken(response['refresh_token']);
      }
    } catch (e) {
      await _localStorage.clearAuth();
      throw Exception('Token refresh failed: $e');
    }
  }
}
