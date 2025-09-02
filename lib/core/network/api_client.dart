import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/app_constants.dart';
import '../../data/models/user_model.dart';
import '../../data/models/customer_model.dart';
import '../../data/models/ride_model.dart';
import '../../data/models/score_model.dart';
import '../../data/models/notification_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth endpoints
  @POST('/auth/send-otp')
  Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> data);

  @POST('/auth/verify-otp')
  Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> data);

  @POST('/auth/refresh-token')
  Future<Map<String, dynamic>> refreshToken(@Body() Map<String, dynamic> data);

  @POST('/auth/logout')
  Future<void> logout();

  // User endpoints
  @GET('/user/profile')
  Future<UserModel> getProfile();

  @PUT('/user/profile')
  Future<UserModel> updateProfile(@Body() Map<String, dynamic> data);

  @POST('/user/kyc')
  Future<DriverModel> submitKyc(@Body() Map<String, dynamic> data);

  // Driver endpoints
  @GET('/driver/status')
  Future<DriverModel> getDriverStatus();

  @PUT('/driver/status')
  Future<DriverModel> updateDriverStatus(@Body() Map<String, dynamic> data);

  @GET('/driver/score')
  Future<ScoreModel> getDriverScore();

  // Customer endpoints
  @GET('/customers')
  Future<List<CustomerModel>> getCustomers(@Queries() Map<String, dynamic> queries);

  @POST('/customers')
  Future<CustomerModel> postCustomer(@Body() CustomerPostModel customer);

  @GET('/customers/{id}')
  Future<CustomerModel> getCustomer(@Path('id') String id);

  @PUT('/customers/{id}/claim')
  Future<CustomerModel> claimCustomer(@Path('id') String id);

  @PUT('/customers/{id}/cancel')
  Future<CustomerModel> cancelCustomer(@Path('id') String id, @Body() Map<String, dynamic> data);

  // Ride endpoints
  @GET('/rides')
  Future<List<RideModel>> getRides(@Queries() Map<String, dynamic> queries);

  @GET('/rides/{id}')
  Future<RideModel> getRide(@Path('id') String id);

  @PUT('/rides/{id}/start')
  Future<RideModel> startRide(@Path('id') String id);

  @PUT('/rides/{id}/complete')
  Future<RideModel> completeRide(@Path('id') String id, @Body() Map<String, dynamic> data);

  @PUT('/rides/{id}/cancel')
  Future<RideModel> cancelRide(@Path('id') String id, @Body() Map<String, dynamic> data);

  // Notification endpoints
  @GET('/notifications')
  Future<List<NotificationModel>> getNotifications(@Queries() Map<String, dynamic> queries);

  @PUT('/notifications/{id}/read')
  Future<NotificationModel> markNotificationAsRead(@Path('id') String id);

  @PUT('/notifications/read-all')
  Future<void> markAllNotificationsAsRead();
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
