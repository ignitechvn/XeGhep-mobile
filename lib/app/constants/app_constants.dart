class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.xeghep.com';
  static const String apiVersion = '/v1';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userProfileKey = 'user_profile';
  static const String driverStatusKey = 'driver_status';
  static const String favoriteRoutesKey = 'favorite_routes';
  static const String notificationSettingsKey = 'notification_settings';
  
  // Hive Box Names
  static const String authBox = 'auth_box';
  static const String profileBox = 'profile_box';
  static const String marketplaceBox = 'marketplace_box';
  static const String ridesBox = 'rides_box';
  static const String notificationsBox = 'notifications_box';
  
  // Score System
  static const int minScoreToReceive = 0;
  static const int maxNegativeScore = -3;
  static const int scorePenaltyDays = 7;
  static const int maxDailyPosts = 10;
  static const int cooldownMinutes = 30;
  
  // Ride Status
  static const String rideStatusPending = 'PENDING';
  static const String rideStatusAssigned = 'ASSIGNED';
  static const String rideStatusInProgress = 'IN_PROGRESS';
  static const String rideStatusCompleted = 'COMPLETED';
  static const String rideStatusCancelled = 'CANCELLED';
  
  // Vehicle Types
  static const String vehicleType4Seat = '4_SEAT';
  static const String vehicleType7Seat = '7_SEAT';
  
  // Notification Types
  static const String notificationTypeNewCustomer = 'NEW_CUSTOMER';
  static const String notificationTypeRideAssigned = 'RIDE_ASSIGNED';
  static const String notificationTypeRideReminder = 'RIDE_REMINDER';
  static const String notificationTypeScoreUpdate = 'SCORE_UPDATE';
  static const String notificationTypeSystemAlert = 'SYSTEM_ALERT';
  
  // Map Configuration
  static const double defaultZoom = 15.0;
  static const double maxZoom = 20.0;
  static const double minZoom = 5.0;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Validation
  static const int minPhoneLength = 10;
  static const int maxPhoneLength = 11;
  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;
  static const int maxNoteLength = 200;
  
  // File Upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png'];
  
  // Retry Configuration
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  
  // Cache Configuration
  static const Duration cacheExpiration = Duration(hours: 1);
  static const Duration shortCacheExpiration = Duration(minutes: 15);
  static const Duration longCacheExpiration = Duration(days: 7);
}
