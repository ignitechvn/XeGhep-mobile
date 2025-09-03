import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app_constants.dart';
import '../../data/models/user_model.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/ride_model.dart';
import '../../data/models/score_model.dart';
import '../../data/models/notification_model.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient(this._dio, {String? baseUrl}) : baseUrl = baseUrl ?? AppConstants.baseUrl;

  // Auth endpoints
  Future<Response<Map<String, dynamic>>> sendOtp(Map<String, dynamic> data) async {
    return await _dio.post('/auth/send-otp', data: data);
  }

  Future<Response<Map<String, dynamic>>> verifyOtp(Map<String, dynamic> data) async {
    return await _dio.post('/auth/verify-otp', data: data);
  }

  Future<Response<Map<String, dynamic>>> refreshToken(Map<String, dynamic> data) async {
    return await _dio.post('/auth/refresh-token', data: data);
  }

  Future<void> logout() async {
    await _dio.post('/auth/logout');
  }

  // User endpoints
  Future<UserModel> getProfile() async {
    final response = await _dio.get('/user/profile');
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final response = await _dio.put('/user/profile', data: data);
    return UserModel.fromJson(response.data);
  }

  Future<DriverModel> submitKyc(Map<String, dynamic> data) async {
    final response = await _dio.post('/user/kyc', data: data);
    return DriverModel.fromJson(response.data);
  }

  // Driver endpoints
  Future<DriverModel> getDriverStatus() async {
    final response = await _dio.get('/driver/status');
    return DriverModel.fromJson(response.data);
  }

  Future<DriverModel> updateDriverStatus(Map<String, dynamic> data) async {
    final response = await _dio.put('/driver/status', data: data);
    return DriverModel.fromJson(response.data);
  }

  Future<ScoreModel> getDriverScore() async {
    final response = await _dio.get('/driver/score');
    return ScoreModel.fromJson(response.data);
  }

  // Customer endpoints
  Future<List<CustomerModel>> getCustomers(Map<String, dynamic> queries) async {
    final response = await _dio.get('/customers', queryParameters: queries);
    return (response.data as List)
        .map((item) => CustomerModel.fromJson(item))
        .toList();
  }

  Future<CustomerModel> postCustomer(Map<String, dynamic> customer) async {
    final response = await _dio.post('/customers', data: customer);
    return CustomerModel.fromJson(response.data);
  }

  Future<CustomerModel> getCustomer(String id) async {
    final response = await _dio.get('/customers/$id');
    return CustomerModel.fromJson(response.data);
  }

  Future<CustomerModel> claimCustomer(String id) async {
    final response = await _dio.put('/customers/$id/claim');
    return CustomerModel.fromJson(response.data);
  }

  Future<CustomerModel> cancelCustomer(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/customers/$id/cancel', data: data);
    return CustomerModel.fromJson(response.data);
  }

  // Ride endpoints
  Future<List<RideModel>> getRides(Map<String, dynamic> queries) async {
    final response = await _dio.get('/rides', queryParameters: queries);
    return (response.data as List)
        .map((item) => RideModel.fromJson(item))
        .toList();
  }

  Future<RideModel> getRide(String id) async {
    final response = await _dio.get('/rides/$id');
    return RideModel.fromJson(response.data);
  }

  Future<RideModel> startRide(String id) async {
    final response = await _dio.put('/rides/$id/start');
    return RideModel.fromJson(response.data);
  }

  Future<RideModel> completeRide(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/rides/$id/complete', data: data);
    return RideModel.fromJson(response.data);
  }

  Future<RideModel> cancelRide(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/rides/$id/cancel', data: data);
    return RideModel.fromJson(response.data);
  }

  // Notification endpoints
  Future<List<NotificationModel>> getNotifications(Map<String, dynamic> queries) async {
    final response = await _dio.get('/notifications', queryParameters: queries);
    return (response.data as List)
        .map((item) => NotificationModel.fromJson(item))
        .toList();
  }

  Future<NotificationModel> markNotificationAsRead(String id) async {
    final response = await _dio.put('/notifications/$id/read');
    return NotificationModel.fromJson(response.data);
  }

  Future<void> markAllNotificationsAsRead() async {
    await _dio.put('/notifications/read-all');
  }

  // Generic HTTP methods for marketplace
  Future<Response<Map<String, dynamic>>> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response<Map<String, dynamic>>> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response<Map<String, dynamic>>> put(String path, {dynamic data}) async {
    return await _dio.put(path, data: data);
  }

  Future<Response<Map<String, dynamic>>> delete(String path) async {
    return await _dio.delete(path);
  }
}



class ApiClientFactory {
  static ApiClient create() {
    final dio = Dio();
    
    // Add interceptors
    dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
      RetryInterceptor(),
    ]);

    return ApiClient(dio);
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.authTokenKey);
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Handle token refresh
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString(AppConstants.refreshTokenKey);
      
      if (refreshToken != null) {
        try {
          final dio = Dio();
          final response = await dio.post(
            '${AppConstants.baseUrl}/auth/refresh-token',
            data: {'refresh_token': refreshToken},
          );
          
          if (response.statusCode == 200) {
            final newToken = response.data['access_token'];
            await prefs.setString(AppConstants.authTokenKey, newToken);
            
            // Retry the original request
            final options = err.requestOptions;
            options.headers['Authorization'] = 'Bearer $newToken';
            final retryResponse = await dio.fetch(options);
            handler.resolve(retryResponse);
            return;
          }
        } catch (e) {
          // Refresh failed, redirect to login
          await prefs.remove(AppConstants.authTokenKey);
          await prefs.remove(AppConstants.refreshTokenKey);
        }
      }
    }
    
    handler.next(err);
  }
}

class RetryInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      await Future.delayed(AppConstants.retryDelay);
      try {
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // Retry failed
      }
    }
    
    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }
}